abstract class LoginEvent {}

class LoginEmailChanged extends LoginEvent {
  final String email;
  LoginEmailChanged({this.email});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  LoginPasswordChanged({this.password});
}

class ObscurePassword extends LoginEvent {
  final bool obscurePassword;
  ObscurePassword({this.obscurePassword});
}

class LoginResetForm extends LoginEvent {}

class LoginSubmitted extends LoginEvent {}
