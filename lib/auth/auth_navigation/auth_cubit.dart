import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_credentials.dart';
import '../../app_navigation/session_cubit.dart';

enum AuthState { login, signUp, phoneVerification, otp, forgotPassword }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;
  final AuthState authState;
  AuthCredentials credentials;
  bool forVerification;

  AuthCubit({
    this.sessionCubit,
    this.authState,
    this.credentials,
  }) : super(authState);

  void showLogin() => emit(AuthState.login);

  void showSignUp() => emit(AuthState.signUp);

  void showForgotPassword() => emit(AuthState.forgotPassword);

  void showPhoneVerification({String email, String password}) {
    credentials = credentials.copyWith(
      email: email,
      password: password,
    );
    emit(AuthState.phoneVerification);
  }

  void showOtp({String phoneNumber, bool verification}) {
    forVerification = verification;
    credentials = credentials.copyWith(
      phoneNumber: phoneNumber,
    );
    emit(AuthState.otp);
  }

  // To exit the Auth Flow
  void launchSession({AuthCredentials credentials}) {
    sessionCubit.showSession(credentials);
  }
}
