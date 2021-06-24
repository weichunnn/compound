import 'package:compound/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authenticated_session_cubit.dart';
import '../../authenticated_session/dashboard/view/dashboard_screen.dart';
import '../notifications/view/notifications_screen.dart';
import '../../authenticated_session/monthly/view/monthly_screen.dart';
import '../../authenticated_session/income_expenditure/income_expenditure_screen.dart';

class AuthenticatedSessionNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticatedSessionCubit, AuthenticatedSessionState>(builder: (context, state) {
      List restrictedState = [AuthenticatedSessionState.notifications];
      return Scaffold(
        bottomNavigationBar: restrictedState.contains(state) ? null : BottomNavBar(),
        body: Navigator(
          // Material Page to return without scaffold as scaffold is already defined at the top of tree to provide consistent Nav Bar
          pages: [
            if (state == AuthenticatedSessionState.dashboard) MaterialPage(child: DashboardScreen()),
            if (state == AuthenticatedSessionState.notifications) MaterialPage(child: NotificationsScreen()),
            if (state == AuthenticatedSessionState.monthly) MaterialPage(child: MonthlyScreen()),
            if (state == AuthenticatedSessionState.income) MaterialPage(child: IncomeExpenditureScreen(isIncome: true)),
            if (state == AuthenticatedSessionState.expenditure)
              MaterialPage(child: IncomeExpenditureScreen(isIncome: false)),
          ],
          onPopPage: (route, result) => route.didPop(result),
        ),
      );
    });
  }
}
