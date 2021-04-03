import 'package:compound/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../form_submission_status.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({this.authRepo}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEmailChanged) {
      yield state.copyWith(email: event.email);
    }

    if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    }

    if (event is ObscurePassword) {
      yield state.copyWith(obscurePassword: event.obscurePassword);
    }

    if (event is LoginSubmitted) {
      yield state.copyWith(formSubmissionStatus: SubmissionInProgress());

      try {
        await authRepo.login();
        yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formSubmissionStatus: SubmissionFailure(e));
      }
    }
  }
}
