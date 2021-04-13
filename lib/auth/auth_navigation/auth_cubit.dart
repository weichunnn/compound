import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_credentials.dart';
import '../../app_navigation/session_cubit.dart';

enum AuthState { login, signUp, otp, forgotPassword, resetPassword }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;
  final AuthState authState;
  AuthCredentials credentials;

  AuthCubit({
    this.sessionCubit,
    this.authState,
    this.credentials,
  }) : super(authState);

  void showLogin() => emit(AuthState.login);

  void showSignUp() => emit(AuthState.signUp);

  void showForgotPassword() => emit(AuthState.forgotPassword);

  void showEmailVerificationOtp({
    String email,
    String password,
  }) {
    credentials = credentials.copyWith(
      email: email,
      password: password,
    );
    emit(AuthState.otp);
  }

  void showResetPassword({String email}) {
    credentials = credentials.copyWith(
      email: email,
    );
    emit(AuthState.resetPassword);
  }

  // To exit the Auth Flow
  void launchSession({AuthCredentials credentials}) {
    sessionCubit.showSession(credentials);
  }
}
