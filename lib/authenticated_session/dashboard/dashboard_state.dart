import 'package:compound/auth/form_submission_status.dart';

class DashboardState {
  final FormSubmissionStatus formSubmissionStatus;
  final List<String> overviewTimeSelected;
  final List<String> overviewTypeSelected;
  final int counter;
  List<String> overviewTimeSelection = ['1M', '3M', '6M', '1Y', 'YTD', 'All'];
  List<String> overviewTypeSelection = [
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

  List<Map<String, dynamic>> transactions = [
    {'category': 'Food and Drinks', 'merchant': 'Tailor', 'amount': -125, 'date': 'Jan 10'},
    {'category': 'Sport and Games', 'merchant': 'Forever Fitness', 'amount': -25, 'date': 'Jan 07'},
    {'category': 'Income', 'merchant': 'Salary', 'amount': 200, 'date': 'Jan 03'},
    {'category': 'Side Hustle', 'merchant': 'Etsy Dashboard', 'amount': -125, 'date': 'Dec 02'},
    {'category': 'Sport and Games', 'merchant': 'Forever Fitness', 'amount': -25, 'date': 'Aug 01'},
  ];

  DashboardState({
    this.counter = 0,
    this.formSubmissionStatus = const InitialFormStatus(),
    this.overviewTimeSelected = const ['1M'],
    this.overviewTypeSelected = const ['Net Worth'],
  });
  DashboardState copywith({
    FormSubmissionStatus formSubmissionStatus,
    List<String> overviewTimeSelected,
    List<String> overviewTypeSelected,
  }) {
    return DashboardState(
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
      overviewTimeSelected: overviewTimeSelected ?? this.overviewTimeSelected,
      overviewTypeSelected: overviewTypeSelected ?? this.overviewTypeSelected,
    );
  }
}
