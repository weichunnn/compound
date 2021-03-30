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
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String _phoneNumber = arguments['phoneNumber'];

    return SafeArea(
      minimum: EdgeInsets.only(left: 35, right: 35, bottom: 20),
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            NormalTemplate(
              image: 'assets/images/forgot_password.svg',
              title: 'Verification Code',
              caption: 'Please enter the code sent to $_phoneNumber',
              bolded: _phoneNumber,
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
