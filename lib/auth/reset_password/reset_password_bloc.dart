import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/reset_password/reset_password_event.dart';
import '../../auth/reset_password/reset_password_state.dart';
import '../auth_repository.dart';
import '../../auth/auth_navigation/auth_cubit.dart';
import '../form_submission_status.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  ResetPasswordBloc({this.authCubit, this.authRepo})
      : super(ResetPasswordState());

  @override
  Stream<ResetPasswordState> mapEventToState(ResetPasswordEvent event) async* {
    if (event is ResetPasswordOtpChanged) {
      yield state.copyWith(otp: event.otp);
    }

    if (event is ResetPasswordPasswordChanged) {
      yield state.copyWith(password: event.password);
    }
    if (event is ResetPasswordConfirmPasswordChanged) {
      yield state.copyWith(confirmPassword: event.confirmPassword);
    }
    if (event is ObscurePassword) {
      yield state.copyWith(obscurePassword: event.obscurePassword);
    }

    if (event is ResetPasswordSubmitted) {
      yield state.copyWith(formSubmissionStatus: SubmissionInProgress());
      try {
        await authRepo.resetForgotPassword(
          otp: state.otp,
          password: state.password,
        );
        yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
        authCubit.showLogin();
      } catch (e) {
        String errorMessage;
        if (e.code == 'InvalidParameterException' ||
            e.code == 'NotAuthorizedException' ||
            e.code == 'CodeMismatchException' ||
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
