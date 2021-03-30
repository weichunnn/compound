import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../components/normal_template.dart';
import '../../../components/phone_input_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 35, right: 35, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            NormalTemplate(
              image: 'assets/images/phone_verification.svg',
              title: 'Verify your number',
              caption:
                  'Please enter your country code and your \ncurrent mobile phone number',
            ),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            PhoneInputForm(
              forVerification: true,
            ),
          ],
        ),
      ),
    );
  }
}
