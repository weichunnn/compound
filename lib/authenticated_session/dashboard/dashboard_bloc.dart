import 'package:compound/authenticated_session/dashboard/dashboard_event.dart';
import 'package:compound/authenticated_session/dashboard/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:core';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState());

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is OverviewTimeSelected) {
      yield state.copywith(overviewTimeSelected: [event.selectedText]);
    }

    if (event is OverviewTypeSelected) {
      final overviewTypeSelected =
          List<String>.from(this.state.overviewTypeSelected);
      overviewTypeSelected.contains(event.selectedText)
          ? overviewTypeSelected.remove(event.selectedText)
          : overviewTypeSelected.add(event.selectedText);
      if (overviewTypeSelected.length == 0) {
        return;
      }
      yield state.copywith(overviewTypeSelected: overviewTypeSelected);
    }
  }
}
