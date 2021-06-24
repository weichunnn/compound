import 'package:compound/authenticated_session/income_expenditure/income_expenditure_event.dart';
import 'package:compound/authenticated_session/income_expenditure/income_expenditure_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeExpenditureBloc extends Bloc<IncomeExpenditureEvent, IncomeExpenditureState> {
  IncomeExpenditureBloc() : super(IncomeExpenditureState());

  @override
  Stream<IncomeExpenditureState> mapEventToState(IncomeExpenditureEvent event) async* {
    if (event is TimeOptionSelected) {
      yield state.copywith(timeOptionSelected: [event.selectedText]);
    }
    if (event is DetailedOptionSelected) {
      yield state.copywith(detailedOptionSelected: event.selectedText);
    }
  }
}
