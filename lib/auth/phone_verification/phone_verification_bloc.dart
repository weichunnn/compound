// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../auth_repository.dart';
// import '../form_submission_status.dart';
// import 'phone_verification_event.dart';
// import 'phone_verification_state.dart';
// import '../../auth/auth_navigation/auth_cubit.dart';

// class PhoneVerificationBloc
//     extends Bloc<PhoneVerificationEvent, PhoneVerificationState> {
//   final AuthRepository authRepo;
//   final AuthCubit authCubit;

//   PhoneVerificationBloc({this.authCubit, this.authRepo})
//       : super(PhoneVerificationState());

//   @override
//   Stream<PhoneVerificationState> mapEventToState(
//       PhoneVerificationEvent event) async* {
//     if (event is PhoneVerificationNumberChanged) {
//       yield state.copyWith(phoneNumber: event.phoneNumber);
//     }

//     if (event is PhoneVerificationSubmitted) {
//       yield state.copyWith(formSubmissionStatus: SubmissionInProgress());
//       authCubit.showOtp(phoneNumber: state.phoneNumber, verification: true);
//     }
//   }
// }
