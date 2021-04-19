import 'package:form_field_validator/form_field_validator.dart';

import '../form_submission_status.dart';

class LoginState {
  final String email;
  final String password;
  final bool obscurePassword;
  final String errorMessage;
  final FormSubmissionStatus formSubmissionStatus;

  // Validators for Form
  final emailValidator = MultiValidator(
    [
      RequiredValidator(
        errorText: 'Email is required',
      ),
      EmailValidator(
        errorText: 'Email must be valid',
      ),
    ],
  );

  final passwordValidator = RequiredValidator(
    errorText: 'Password is required',
  );

  LoginState({
    this.email = '',
    this.password = '',
    this.obscurePassword = true,
    this.errorMessage = '',
    this.formSubmissionStatus,
  });

  LoginState copyWith({
    String email,
    String password,
    bool obscurePassword,
    String errorMessage,
    FormSubmissionStatus formSubmissionStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      errorMessage: errorMessage ?? this.errorMessage,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
