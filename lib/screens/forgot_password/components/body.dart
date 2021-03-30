import 'package:compound/components/phone_input_form.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../components/normal_template.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 35, right: 35, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            NormalTemplate(
              image: 'assets/images/forgot_password.svg',
              title: 'Forgot your password?',
              caption:
                  'Don’t worry! Enter your phone number below to receive your password reset instructions',
            ),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            PhoneInputForm(),
          ],
        ),
      ),
    );
  }
}
