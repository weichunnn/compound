import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'session_cubit.dart';
import 'session_state.dart';
import '../welcome/welcome_navigation/welcome_cubit.dart';
import '../welcome/welcome_navigation/welcome_navigator.dart';
import '../session/session_view.dart';
import '../session/loading_screen.dart';

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

          if (state is Authenticated) MaterialPage(child: SessionView()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
