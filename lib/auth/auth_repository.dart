class AuthRepository {
  Future<String> login() async {
    print('Attempting login');
    await Future.delayed(Duration(seconds: 3));
    print('Login successful');
    return 'abc';
  }

  Future<String> attemptAutoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    throw Exception('No Auto');
  }

  Future<void> signUp({
    String email,
    String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    print('Sign Up successful');
  }

  Future<String> sendVerificationOtpToBackend({
    String phoneNumber,
    String otp,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return 'abc';
  }

  Future<String> sendVerificationOtpToUser({
    String phoneNumber,
  }) async {
    await Future.delayed(Duration(seconds: 3));
    return 'abc';
  }

  Future<String> sendForgotPasswordOtpToBackend({
    String phoneNumber,
    String otp,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return 'abc';
  }

  Future<String> sendForgotPasswordOtpToUser({
    String phoneNumber,
  }) async {
    await Future.delayed(Duration(seconds: 3));
    return 'abc';
  }

  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
