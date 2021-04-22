import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/auth_repository.dart';
import 'session_state.dart';
import '../model/user.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;

  SessionCubit({this.authRepo}) : super(UnknownSessionState()) {
    // if credentials are available, try to log in user in to session
    Future.delayed(Duration(seconds: 2), () {
      attemptAutoLogin();
    });
  }

  Future<void> attemptAutoLogin() async {
    await authRepo.init();
    try {
      bool sessionStatus = await authRepo.checkAuthenticated();
      User currentUser = await authRepo.getCurrentUser();
      if (sessionStatus) {
        emit(Authenticated(user: currentUser));
      } else {
        showAuth();
      }
    } catch (e) {
      showAuth();
    }
  }

  void showSession({User user}) {
    emit(Authenticated(user: user));
  }

  void signOut() {
    authRepo.signOut();
    showAuth();
  }

  void showAuth() => emit(Unauthenticated());
}
