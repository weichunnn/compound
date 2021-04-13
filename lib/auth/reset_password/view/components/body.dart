import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import '../../../../auth/reset_password/view/components/reset_password_form.dart';
import '../../../../components/normal_template.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 35, right: 35, bottom: 20),
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            NormalTemplate(
              image: 'assets/images/reset_password.svg',
              title: 'Reset Password',
              caption:
                  'Enter the OTP received, and your new password below. We are just being extra safe to protect your account.',
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            ResetPasswordForm(),
          ],
        ),
      ),
    );
  }
}
