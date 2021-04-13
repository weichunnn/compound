import 'package:form_field_validator/form_field_validator.dart';

import '../../auth/form_submission_status.dart';

class ResetPasswordState {
  final String otp;
  final String password;
  final String confirmPassword;
  final bool obscurePassword;
  final FormSubmissionStatus formSubmissionStatus;

  // Validators for Form
  final otpValidator = MultiValidator(
    [
      RequiredValidator(
        errorText: 'OTP is required',
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
        r'(?=.*?[#?!@$%^&*-])',
        errorText: 'At least one special character',
      ),
    ],
  );

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

  ResetPasswordState({
    this.otp = '',
    this.password = '',
    this.confirmPassword = '',
    this.obscurePassword = true,
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  ResetPasswordState copyWith({
    String otp,
    String password,
    String confirmPassword,
    bool obscurePassword,
    FormSubmissionStatus formSubmissionStatus,
  }) {
    return ResetPasswordState(
      otp: otp ?? this.otp,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
