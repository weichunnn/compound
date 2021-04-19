abstract class OtpEvent {}

class OtpSubmitted extends OtpEvent {
  final String otp;
  OtpSubmitted({this.otp});
}

class StartTimer extends OtpEvent {}

class ResendConfirmationEmail extends OtpEvent {}

class OtpResetForm extends OtpEvent {}

class Tick extends OtpEvent {
  final int duration;
  Tick({this.duration});
}
