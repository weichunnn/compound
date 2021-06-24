import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthenticatedSessionState { dashboard, notifications, monthly, income, expenditure }

class AuthenticatedSessionCubit extends Cubit<AuthenticatedSessionState> {
  AuthenticatedSessionCubit() : super(AuthenticatedSessionState.dashboard);

  void showDashboard() => emit(AuthenticatedSessionState.dashboard);

  void showNotifications() => emit(AuthenticatedSessionState.notifications);

  void showMonthly() => emit(AuthenticatedSessionState.monthly);

  void showIncomeExpenditure({isIncome}) {
    isIncome ? emit(AuthenticatedSessionState.income) : emit(AuthenticatedSessionState.expenditure);
  }
}
