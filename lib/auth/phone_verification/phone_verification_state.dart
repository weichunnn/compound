import 'package:flutter/material.dart';

import '../../constants.dart';
import '../form_submission_status.dart';

class PhoneVerificationState {
  String phoneNumber;
  final bool forVerification;
  Color borderColor;
  final FormSubmissionStatus formSubmissionStatus;

  String phoneValidator(value) {
    if (value.isEmpty || value.length < 11) {
      this.borderColor = kErrorColor;
      return '';
    } else {
      this.borderColor = kPrimaryColor;
      return null;
    }
  }

  PhoneVerificationState({
    this.phoneNumber = '',
    this.forVerification = true,
    this.borderColor = kGreyColor,
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  PhoneVerificationState copyWith({
    String phoneNumber,
    Color borderColor,
    FormSubmissionStatus formSubmissionStatus,
  }) {
    return PhoneVerificationState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      borderColor: borderColor ?? this.borderColor,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
