import 'package:form_field_validator/form_field_validator.dart';

import '../form_submission_status.dart';

class SignUpState {
  final String email;
  final String password;
  final String confirmPassword;
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

  final passwordValidator = MultiValidator(
    [
      RequiredValidator(
        errorText: 'Password is required',
      ),
      MinLengthValidator(
        8,
        errorText: 'At least 8 digits long',
      ),
      PatternValidator(
        r'([A-Z]+)',
        errorText: 'At least one uppercase letter',
      ),
      PatternValidator(
        r'([a-z]+)',
        errorText: 'At least one lowercase letter',
      ),
      PatternValidator(
        r'([1-9]+)',
        errorText: 'At least one number',
      ),
      PatternValidator(
        r'(?=.*?[#?!@$%^&*-])',
        errorText: 'At least one special character',
      ),
    ],
  );

  // Attempted to use MatchValidator with RequiredValidator
  // Both are of diffrent type where MatchValidator returns a String and RequiredValidator returns a Function
  String confirmPasswordValidator(value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else {
      return MatchValidator(errorText: '').validateMatch(
        value,
        this.password,
      );
    }
  }

  bool passwordSimilar() {
    if (password == confirmPassword && password.isNotEmpty) {
      return true;
    }
    return false;
  }

  SignUpState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.obscurePassword = true,
    this.errorMessage = '',
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  SignUpState copyWith({
    String email,
    String password,
    String confirmPassword,
    bool obscurePassword,
    String errorMessage,
    FormSubmissionStatus formSubmissionStatus,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      errorMessage: errorMessage ?? this.errorMessage,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
