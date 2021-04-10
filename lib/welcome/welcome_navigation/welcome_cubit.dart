import 'package:flutter_bloc/flutter_bloc.dart';

enum WelcomeState { welcome, splash, gotoAuth }

class WelcomeCubit extends Cubit<WelcomeState> {
  // Toggle entry point for auth flow
  bool authLoginFlag;
  WelcomeCubit() : super(WelcomeState.welcome);

  void showWelcome() => emit(WelcomeState.welcome);

  void showSplash() => emit(WelcomeState.splash);

  void gotoLogin() {
    this.authLoginFlag = true;
    emit(WelcomeState.gotoAuth);
  }

  void gotoSignUp() {
    this.authLoginFlag = false;
    emit(WelcomeState.gotoAuth);
  }
}
