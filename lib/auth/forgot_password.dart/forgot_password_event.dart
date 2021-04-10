abstract class ForgotPasswordEvent {}

class ForgotPasswordPhoneNumberChanged extends ForgotPasswordEvent {
  final String phoneNumber;
  ForgotPasswordPhoneNumberChanged({this.phoneNumber});
}

class ForgotPasswordPhoneNumberSubmitted extends ForgotPasswordEvent {}
