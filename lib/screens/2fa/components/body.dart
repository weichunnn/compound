import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../components/normal_template.dart';
import '../../../components/default_button.dart';
import 'authentication_factor.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          NormalTemplate(
            image: 'assets/images/2fa.svg',
            title: 'Secure Account',
            caption:
                'Enable either 2-factor-authentication to secure your account from unwanted eyes',
          ),
          SizedBox(
            height: getProportionateScreenHeight(45),
          ),
          AuthenticationFactor(
            image: 'assets/icons/password.svg',
            title: 'Pin Code',
            caption: 'Medium to High Security',
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          AuthenticationFactor(
            image: 'assets/icons/fingerprint.svg',
            title: 'Biometrics',
            caption: 'High Security',
          ),
          Spacer(),
          DefaultButton(
            text: 'Continue',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
