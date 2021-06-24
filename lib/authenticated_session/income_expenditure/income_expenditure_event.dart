abstract class IncomeExpenditureEvent {}

class TimeOptionSelected extends IncomeExpenditureEvent {
  final String selectedText;

  TimeOptionSelected({this.selectedText});
}

class DetailedOptionSelected extends IncomeExpenditureEvent {
  final String selectedText;

  DetailedOptionSelected({this.selectedText});
}
