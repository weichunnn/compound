import 'package:flutter_bloc/flutter_bloc.dart';

import '../form_submission_status.dart';
import '../../auth/auth_navigation/auth_cubit.dart';
import '../auth_repository.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';
import '../../model/user.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  SignUpBloc({this.authRepo, this.authCubit}) : super(SignUpState());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpEmailChanged) {
      yield state.copyWith(email: event.email);
    }

    if (event is SignUpPasswordChanged) {
      yield state.copyWith(password: event.password);
    }

    if (event is SignUpConfirmPasswordChanged) {
      yield state.copyWith(confirmPassword: event.confirmPassword);
    }

    if (event is ObscurePassword) {
      yield state.copyWith(obscurePassword: event.obscurePassword);
    }

    if (event is SignUpSubmitted) {
      yield state.copyWith(formSubmissionStatus: SubmissionInProgress());

      try {
        User user = await authRepo.signUp(
          email: state.email,
          password: state.password,
        );
        yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
        authCubit.showEmailVerificationOtp(user: user);
      } catch (e) {
        yield state.copyWith(formSubmissionStatus: SubmissionFailure(e));
      }
    }
  }
}
