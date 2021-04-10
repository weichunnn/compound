import 'package:flutter/material.dart';

import '../../constants.dart';
import '../form_submission_status.dart';

class ForgotPasswordState {
  final String phoneNumber;
  final bool forVerification;
  Color borderColor;
  final FormSubmissionStatus formSubmissionStatus;

  String phoneValidator(value) {
    if (value.isEmpty || value.length < 12) {
      this.borderColor = kErrorColor;
      return '';
    } else {
      this.borderColor = kPrimaryColor;
      return null;
    }
  }

  ForgotPasswordState({
    this.phoneNumber = '',
    this.forVerification = false,
    this.borderColor = kGreyColor,
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  ForgotPasswordState copyWith({
    String phoneNumber,
    Color borderColor,
    FormSubmissionStatus formSubmissionStatus,
  }) {
    return ForgotPasswordState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      borderColor: borderColor ?? this.borderColor,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
