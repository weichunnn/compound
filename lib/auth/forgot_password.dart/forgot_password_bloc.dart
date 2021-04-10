import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_repository.dart';
import '../form_submission_status.dart';
import '../../auth/auth_navigation/auth_cubit.dart';
import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  ForgotPasswordBloc({this.authCubit, this.authRepo})
      : super(ForgotPasswordState());

  @override
  Stream<ForgotPasswordState> mapEventToState(
      ForgotPasswordEvent event) async* {
    if (event is ForgotPasswordPhoneNumberChanged) {
      yield state.copyWith(phoneNumber: event.phoneNumber);
    }

    if (event is ForgotPasswordPhoneNumberSubmitted) {
      try {
        await authRepo.sendForgotPasswordOtpToUser(
          phoneNumber: state.phoneNumber,
        );
        yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
        authCubit.showOtp(
          phoneNumber: state.phoneNumber,
          verification: false,
        );
      } catch (e) {
        yield state.copyWith(formSubmissionStatus: SubmissionFailure(e));
      }
    }
  }
}
