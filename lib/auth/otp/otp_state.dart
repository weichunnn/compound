import '../form_submission_status.dart';

class OtpState {
  final String otp;
  final bool showResend;
  final int countdown;
  final FormSubmissionStatus formSubmissionStatus;

  OtpState({
    this.otp = '',
    this.showResend = false,
    this.countdown,
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  OtpState copyWith({
    String otp,
    bool showResend,
    int countdown,
    FormSubmissionStatus formSubmissionStatus,
  }) {
    return OtpState(
      otp: otp ?? this.otp,
      showResend: showResend ?? this.showResend,
      countdown: countdown ?? this.countdown,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
