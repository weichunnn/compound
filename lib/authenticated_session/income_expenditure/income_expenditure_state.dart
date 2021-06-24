class IncomeExpenditureState {
  final List<String> timeOptionSelected;
  final String detailedOptionSelected;
  List<String> timeOptionsSelection = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'August',
    'September',
    'October',
    'November',
    'Discember',
  ];

  IncomeExpenditureState({
    this.timeOptionSelected = const ['January'],
    this.detailedOptionSelected = 'Categories',
  });

  IncomeExpenditureState copywith({
    List<String> timeOptionSelected,
    String detailedOptionSelected,
  }) {
    return IncomeExpenditureState(
      timeOptionSelected: timeOptionSelected ?? this.timeOptionSelected,
      detailedOptionSelected: detailedOptionSelected ?? this.detailedOptionSelected,
    );
  }
}
