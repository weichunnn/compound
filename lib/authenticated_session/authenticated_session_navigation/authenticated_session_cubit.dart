import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthenticatedSessionState { dashboard }

class AuthenticatedSessionCubit extends Cubit<AuthenticatedSessionState> {
  AuthenticatedSessionCubit() : super(AuthenticatedSessionState.dashboard);

  void showDashboard() => emit(AuthenticatedSessionState.dashboard);
}
