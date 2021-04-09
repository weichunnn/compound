abstract class SignUpEvent {}

class SignUpEmailChanged extends SignUpEvent {
  final String email;
  SignUpEmailChanged({this.email});
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;
  SignUpPasswordChanged({this.password});
}

class SignUpConfirmPasswordChanged extends SignUpEvent {
  final String confirmPassword;
  SignUpConfirmPasswordChanged({this.confirmPassword});
}

class ObscurePassword extends SignUpEvent {
  final bool obscurePassword;
  ObscurePassword({this.obscurePassword});
}

class SignUpSubmitted extends SignUpEvent {}
