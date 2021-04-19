import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_navigation/auth_cubit.dart';
import '../auth_repository.dart';
import '../form_submission_status.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';
import '../../model/user.dart';

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
        User user = await authRepo.login(
          email: state.email,
          password: state.password,
        );

        if (!user.verified) {
          yield state.copyWith(
            formSubmissionStatus: SubmissionFailure(),
            errorMessage: 'Please verify your email account.',
          );
          user.password = state.password;
          authRepo.resendConfirmationEmail(email: state.email);
          authCubit.showEmailVerificationOtp(user: user);
        } else {
          yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
          authCubit.launchSession(user: user);
        }
      } catch (e) {
        String errorMessage;
        if (e.code == 'InvalidParameterException' ||
            e.code == 'NotAuthorizedException' ||
            e.code == 'UserNotFoundException' ||
            e.code == 'ResourceNotFoundException') {
          errorMessage = e.message;
        } else {
          errorMessage = 'An unknown error had occurred. Please try again.';
        }
        yield state.copyWith(
          formSubmissionStatus: SubmissionFailure(),
          errorMessage: errorMessage,
        );
        yield state.copyWith(formSubmissionStatus: InitialFormStatus());
      }
    }
  }
}
