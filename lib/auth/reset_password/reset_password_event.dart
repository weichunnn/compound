abstract class ResetPasswordEvent {}

class ResetPasswordOtpChanged extends ResetPasswordEvent {
  final String otp;
  ResetPasswordOtpChanged({this.otp});
}

class ResetPasswordPasswordChanged extends ResetPasswordEvent {
  final String password;
  ResetPasswordPasswordChanged({this.password});
}

class ResetPasswordConfirmPasswordChanged extends ResetPasswordEvent {
  final String confirmPassword;
  ResetPasswordConfirmPasswordChanged({this.confirmPassword});
}

class ObscurePassword extends ResetPasswordEvent {
  final bool obscurePassword;
  ObscurePassword({this.obscurePassword});
}

class ResetPasswordResetForm extends ResetPasswordEvent {}

class ResetPasswordSubmitted extends ResetPasswordEvent {}
