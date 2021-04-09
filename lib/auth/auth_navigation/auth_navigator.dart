import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_navigation/auth_cubit.dart';
import '../../auth/otp/views/otp_screen.dart';
import '../../auth/phone_verification/view/phone_verification_screen.dart';
import '../../auth/sign_in/view/sign_in_screen.dart';
import '../../auth/sign_up/view/sign_up_screen.dart';
import '../../auth/forgot_password.dart/view/forgot_password_screen.dart';

class AuthNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state == AuthState.login) MaterialPage(child: SignInScreen()),
          if (state == AuthState.signUp) MaterialPage(child: SignUpScreen()),
          if (state == AuthState.phoneVerification)
            MaterialPage(child: PhoneVerificationScreen()),
          if (state == AuthState.forgotPassword)
            MaterialPage(child: ForgotPasswordScreen()),
          if (state == AuthState.otp) MaterialPage(child: OtpScreen()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
