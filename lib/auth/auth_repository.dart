import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../secrets.dart';
import 'storage.dart';
import '../model/user.dart';

class AuthRepository {
  CognitoUserPool _userPool;
  CognitoUser _cognitoUser;
  CognitoUserSession _session;
  CognitoCredentials credentials;

  AuthRepository(this._userPool);

  /// Initiate user session from local storage if present
  Future<bool> init() async {
    print('AuthRepository initialized');
    final prefs = await SharedPreferences.getInstance();
    final storage = Storage(prefs);
    _userPool.storage = storage;

    // Try to get current user from local user pool
    _cognitoUser = await _userPool.getCurrentUser();
    if (_cognitoUser == null) {
      return false;
    }

    _session = await _cognitoUser.getSession();
    print('Session State Available: ${_session.isValid()}');

    return _session.isValid();
  }

  /// Get existing user from session with his/her attributes
  Future<User> getCurrentUser() async {
    if (_cognitoUser == null || _session == null) {
      return null;
    }
    if (!_session.isValid()) {
      return null;
    }
    final attributes = await _cognitoUser.getUserAttributes();
    if (attributes == null) {
      return null;
    }
    final user = User.fromUserAttributes(attributes);
    return user;
  }

  /// Retrieve user credentials -- for use with other AWS services
  Future<CognitoCredentials> getCredentials() async {
    if (_cognitoUser == null || _session == null) {
      return null;
    }

    credentials = CognitoCredentials(IdentityPoolId, userPool);
    await credentials.getAwsCredentials(_session.getIdToken().getJwtToken());
    return credentials;
  }

  Future<User> login({String email, String password}) async {
    _cognitoUser = CognitoUser(email, _userPool, storage: _userPool.storage);

    final authDetails = AuthenticationDetails(
      username: email,
      password: password,
    );

    bool isVerified;
    try {
      _session = await _cognitoUser.authenticateUser(authDetails);
      isVerified = true;
    } on CognitoClientException catch (e) {
      if (e.code == 'UserNotConfirmedException') {
        isVerified = false;
      } else {
        rethrow;
      }
    }

    if (!_session.isValid()) {
      return null;
    }

    final attributes = await _cognitoUser.getUserAttributes();
    final user = User.fromUserAttributes(attributes);
    user.verified = isVerified;

    return user;
  }

  /// Confirm user's account with confirmation code sent to email
  Future<void> confirmSignUp({String email, String otp}) async {
    _cognitoUser = CognitoUser(email, _userPool, storage: _userPool.storage);
    await _cognitoUser.confirmRegistration(otp);
  }

  /// Resend confirmation code to user's email
  Future<void> resendConfirmationEmail({String email}) async {
    _cognitoUser = CognitoUser(email, _userPool, storage: _userPool.storage);
    await _cognitoUser.resendConfirmationCode();
  }

  /// Check if user's current session is valid
  Future<bool> checkAuthenticated() async {
    if (_cognitoUser == null || _session == null) {
      return false;
    }
    return _session.isValid();
  }

  /// Sign up User
  Future<User> signUp({String email, String password}) async {
    CognitoUserPoolData data = await _userPool.signUp(
      email,
      password,
    );

    final user = User();
    user.email = email;
    user.password = password;
    user.verified = data.userConfirmed;

    return user;
  }

  Future<void> signOut() async {
    if (credentials != null) {
      await credentials.resetAwsCredentials();
    }
    if (_cognitoUser != null) {
      return _cognitoUser.signOut();
    }
  }

  Future<void> sendForgotPasswordOtp({String email}) async {
    _cognitoUser = CognitoUser(email, _userPool, storage: _userPool.storage);
    await _cognitoUser.forgotPassword();
  }

  Future<void> resetForgotPassword({
    String otp,
    String password,
  }) async {
    await _cognitoUser.confirmPassword(otp, password);
  }
}
