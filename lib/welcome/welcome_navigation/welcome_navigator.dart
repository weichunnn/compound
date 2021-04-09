import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'welcome_cubit.dart';
import '../../app_navigation/session_cubit.dart';
import '../../auth/auth_navigation/auth_cubit.dart';
import '../../auth/auth_navigation/auth_navigator.dart';
import '../../welcome/splash/views/splash_screen.dart';
import '../../welcome/introduction/introduction_screen.dart';
import '../../auth/auth_credentials.dart';

class WelcomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeCubit, WelcomeState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state == WelcomeState.welcome)
            MaterialPage(child: IntroductionScreen()),
          if (state == WelcomeState.splash) MaterialPage(child: SplashScreen()),

          // Handle Auth Flow
          if (state == WelcomeState.gotoAuth)
            MaterialPage(
              child: BlocProvider(
                create: (context) => AuthCubit(
                  sessionCubit: context.read<SessionCubit>(),
                  credentials: AuthCredentials(),
                  authState: context.read<WelcomeCubit>().authLoginFlag
                      ? AuthState.login
                      : AuthState.signUp,
                ),
                child: AuthNavigator(),
              ),
            ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
