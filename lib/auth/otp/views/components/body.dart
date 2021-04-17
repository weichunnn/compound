import 'package:flutter/material.dart';

import '../../../../components/normal_template.dart';
import '../../../../size_config.dart';
import 'otp_form.dart';

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
              image: 'assets/images/forgot_password.svg',
              title: 'Verification Code',
              caption:
                  'Please enter the verfication code we sent to your email',
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            OtpForm(),
          ],
        ),
      ),
    );
  }
}
