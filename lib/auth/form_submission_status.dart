abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class SubmissionInProgress extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {}

class SubmissionFailure extends FormSubmissionStatus {
  final Exception exception;
  SubmissionFailure(this.exception);
}
