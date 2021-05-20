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
  List<Map<String, dynamic>> accounts = [
    {'icon': 'assets/icons/cash.svg', 'title': 'Cash', 'amount': 20500},
    {'icon': 'assets/icons/bank.svg', 'title': 'Bank', 'amount': 20122},
    {'icon': 'assets/icons/investment.svg', 'title': 'Investment', 'amount': -18000},
    {'icon': 'assets/icons/debt.svg', 'title': 'Debts', 'amount': 20000},
    {'icon': 'assets/icons/miscellaneous.svg', 'title': 'Misc', 'amount': -20000},
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
