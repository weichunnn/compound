abstract class PhoneVerificationEvent {}

class PhoneVerificationNumberChanged extends PhoneVerificationEvent {
  final String phoneNumber;
  PhoneVerificationNumberChanged({this.phoneNumber});
}

class PhoneVerificationSubmitted extends PhoneVerificationEvent {}
