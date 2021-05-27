import 'package:compound/authenticated_session/authenticated_session_navigation/authenticated_session_cubit.dart';
import 'package:compound/authenticated_session/authenticated_session_navigation/authenticated_session_navigator.dart';
import 'package:compound/authenticated_session/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'session_cubit.dart';
import 'session_state.dart';
import '../welcome/welcome_navigation/welcome_cubit.dart';
import '../welcome/welcome_navigation/welcome_navigator.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is UnknownSessionState)
            MaterialPage(child: LoadingScreen()),

          // Unauthenticated State -> Enter into Welcome Flow
          if (state is Unauthenticated)
            MaterialPage(
              child: BlocProvider<WelcomeCubit>(
                create: (context) => WelcomeCubit(),
                child: WelcomeNavigator(),
              ),
            ),

          // Authenticated State -> Enter into Authenticated Session Flow
          if (state is Authenticated)
            MaterialPage(
              child: BlocProvider<AuthenticatedSessionCubit>(
                create: (context) => AuthenticatedSessionCubit(),
                child: AuthenticatedSessionNavigator(),
              ),
            ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
