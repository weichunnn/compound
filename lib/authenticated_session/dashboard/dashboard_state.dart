import 'package:compound/auth/form_submission_status.dart';

class DashboardState {
  final FormSubmissionStatus formSubmissionStatus;
  final List overviewTimeSelected;
  final List overviewTypeSelected;
  final int counter;
  List overviewTimeSelection = ['1M', '3M', '6M', '1Y', 'YTD', 'All'];
  List overviewTypeSelection = [
    'Net Worth',
    'Income',
    'Expenditures',
  ];

  DashboardState({
    this.counter = 0,
    this.formSubmissionStatus = const InitialFormStatus(),
    this.overviewTimeSelected = const ['1M'],
    this.overviewTypeSelected = const ['Net Worth'],
  });
  DashboardState copywith({
    FormSubmissionStatus formSubmissionStatus,
    List overviewTimeSelected,
    List overviewTypeSelected,
  }) {
    return DashboardState(
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
      overviewTimeSelected: overviewTimeSelected ?? this.overviewTimeSelected,
      overviewTypeSelected: overviewTypeSelected ?? this.overviewTypeSelected,
    );
  }
}
