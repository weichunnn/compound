import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthenticatedSessionState { dashboard, notifications, monthly }

class AuthenticatedSessionCubit extends Cubit<AuthenticatedSessionState> {
  AuthenticatedSessionCubit() : super(AuthenticatedSessionState.dashboard);

  void showDashboard() => emit(AuthenticatedSessionState.dashboard);

  void showNotifications() => emit(AuthenticatedSessionState.notifications);

  void showMonthly() => emit(AuthenticatedSessionState.monthly);
}
