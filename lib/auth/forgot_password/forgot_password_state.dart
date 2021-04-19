import 'package:form_field_validator/form_field_validator.dart';

import '../form_submission_status.dart';

class ForgotPasswordState {
  final String email;
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

  ForgotPasswordState({
    this.email = '',
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  ForgotPasswordState copyWith({
    String email,
    FormSubmissionStatus formSubmissionStatus,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
