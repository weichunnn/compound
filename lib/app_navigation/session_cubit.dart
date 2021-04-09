import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/auth_credentials.dart';
import '../auth/auth_repository.dart';
import 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;

  SessionCubit({this.authRepo}) : super(UnknownSessionState()) {
    // if credentials are available, try to log in user in to session
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try {
      final userId = await authRepo.attemptAutoLogin();
      emit(Authenticated(user: userId));
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  void showAuth() => emit(Unauthenticated());

  void showSession(AuthCredentials credentials) {
    emit(Authenticated(user: credentials));
  }

  void signOut() {
    authRepo.signOut();
    emit(Unauthenticated());
  }
}
