import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_navigation/session_cubit.dart';
import '../../model/user.dart';

enum AuthState { login, signUp, otp, forgotPassword, resetPassword }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;
  final AuthState authState;
  User currentUser;

  AuthCubit({
    this.sessionCubit,
    this.authState,
  }) : super(authState);

  void showLogin() => emit(AuthState.login);

  void showSignUp() => emit(AuthState.signUp);

  void showForgotPassword() => emit(AuthState.forgotPassword);

  void showEmailVerificationOtp({User user}) {
    currentUser = user;
    emit(AuthState.otp);
  }

  void showResetPassword() {
    emit(AuthState.resetPassword);
  }

  // To exit the Auth Flow
  void launchSession({User user}) {
    sessionCubit.showSession(user: user);
  }
}
