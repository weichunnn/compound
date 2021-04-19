import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_navigation/auth_cubit.dart';
import '../auth_repository.dart';
import '../form_submission_status.dart';
import 'otp_event.dart';
import 'otp_state.dart';
import 'ticker.dart';
import '../../model/user.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;
  final Ticker ticker;
  StreamSubscription<int> _tickerSubscription;

  OtpBloc({
    this.authRepo,
    this.authCubit,
    this.ticker,
  }) : super(OtpState());

  @override
  Stream<OtpState> mapEventToState(OtpEvent event) async* {
    if (event is OtpResetForm) {
      yield state.copyWith(formSubmissionStatus: InitialFormStatus());
    }

    if (event is Tick) {
      yield state.copyWith(countdown: event.duration);
      if (event.duration > 0) {
        yield state.copyWith(countdown: event.duration);
      } else {
        yield state.copyWith(showResend: true);
        _tickerSubscription?.cancel();
      }
    }

    if (event is StartTimer) {
      yield state.copyWith(
        showResend: false,
        countdown: 10,
      );
      _tickerSubscription = ticker
          .tick(ticks: 10)
          .listen((duration) => add(Tick(duration: duration)));
    }

    if (event is ResendConfirmationEmail) {
      authRepo.resendConfirmationEmail(email: authCubit.currentUser.email);
    }

    if (event is OtpSubmitted) {
      yield state.copyWith(
        otp: event.otp,
        formSubmissionStatus: SubmissionInProgress(),
      );
      try {
        await authRepo.confirmSignUp(
          email: authCubit.currentUser.email,
          otp: state.otp,
        );
        yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
        _tickerSubscription?.cancel();

        // Initiate a user session
        User user = await authRepo.login(
          email: authCubit.currentUser.email,
          password: authCubit.currentUser.password,
        );
        authCubit.launchSession(user: user);
      } catch (e) {
        String errorMessage;
        if (e.code == 'InvalidParameterException' ||
            e.code == 'CodeMismatchException' ||
            e.code == 'NotAuthorizedException' ||
            e.code == 'UserNotFoundException' ||
            e.code == 'ResourceNotFoundException') {
          errorMessage = e.message;
        } else {
          errorMessage = 'An unknown error had occurred. Please try again.';
        }
        yield state.copyWith(
          formSubmissionStatus: SubmissionFailure(e),
          errorMessage: errorMessage,
        );
      }
    }
  }
}
