import 'package:flutter/material.dart';

import '../../../components/normal_template.dart';
import '../../../size_config.dart';
import 'otp_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 35),
      child: SingleChildScrollView(
        child: Column(
          children: [
            NormalTemplate(
              image: 'assets/images/forgot_password.svg',
              title: 'Verification Code',
              caption: 'Please enter the code sent to (+60) 123456789',
            ),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            OtpForm(),
          ],
        ),
      ),
    );
  }
}
