import 'package:flutter/material.dart';

import 'package:compound/screens/welcome/welcome_screen.dart';
import 'package:compound/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => WelcomeScreen(),
  '/splash': (context) => SplashScreen(),
};
