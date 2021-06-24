import 'package:flutter_bloc/flutter_bloc.dart';

import 'monthly_event.dart';
import 'monthly_state.dart';

class MonthlyBloc extends Bloc<MonthlyEvent, MonthlyState> {
  MonthlyBloc() : super(MonthlyState());

  @override
  Stream<MonthlyState> mapEventToState(event) async* {}
}
