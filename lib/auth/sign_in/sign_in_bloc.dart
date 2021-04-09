import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_navigation/auth_cubit.dart';
import '../auth_repository.dart';
import '../form_submission_status.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthCubit authCubit;
  final AuthRepository authRepo;

  LoginBloc({this.authCubit, this.authRepo}) : super(LoginState());

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
        authCubit.credentials =
            authCubit.credentials.copyWith(email: state.email);
        authCubit.launchSession(credentials: authCubit.credentials);
      } catch (e) {
        yield state.copyWith(formSubmissionStatus: SubmissionFailure(e));
      }
    }
  }
}
