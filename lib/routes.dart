import 'package:flutter/material.dart';

import 'package:compound/screens/welcome/welcome_screen.dart';
import 'package:compound/screens/splash/splash_screen.dart';
import 'package:compound/screens/sign_in/sign_in_screen.dart';
import 'package:compound/screens/sign_up/sign_up_screen.dart';
import 'package:compound/screens/forgot_password/forgot_password_screen.dart';
import 'package:compound/screens/phone_verification/phone_verification_screen.dart';
import 'package:compound/screens/otp/otp_screen.dart';
import 'package:compound/screens/2fa/settings/fa_settings_screen.dart';
import 'package:compound/screens/2fa/setup_pin.dart/setup_pin_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => WelcomeScreen(),
  '/splash': (context) => SplashScreen(),
  '/sign_in': (context) => SignInScreen(),
  '/sign_up': (context) => SignUpScreen(),
  '/forgot_password': (context) => ForgotPasswordScreen(),
  '/phone_verification': (context) => PhoneVerificationScreen(),
  '/otp': (context) => OtpScreen(),
  '/2fa': (context) => FaSettingsScreen(),
  '/pin': (context) => SetupPinScreen(),
};
