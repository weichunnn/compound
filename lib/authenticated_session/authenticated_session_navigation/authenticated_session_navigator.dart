import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authenticated_session_cubit.dart';
import '../../authenticated_session/dashboard/view/dashboard_screen.dart';

class AuthenticatedSessionNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticatedSessionCubit, AuthenticatedSessionState>(
        builder: (context, state) {
      return Navigator(
        pages: [
          if (state == AuthenticatedSessionState.dashboard)
            MaterialPage(child: DashboardScreen()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
