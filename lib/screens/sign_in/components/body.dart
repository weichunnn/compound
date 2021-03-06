import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'sign_in_form.dart';
import '../../../components/central_divider.dart';
import '../../../components/social_card.dart';
import '../../../components/link_text.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 35),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Ready to take charge of your finance again?',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(12),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            SignInForm(),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            CentralDivider(
              text: 'Or continue with',
            ),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  icon: 'assets/icons/google.svg',
                  onTap: () {},
                  color: Color(0xFFE6E6E6),
                ),
                SocialCard(
                  icon: 'assets/icons/facebook.svg',
                  onTap: () {},
                  color: Color(0xFF475993),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(215),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(14),
                  ),
                ),
                LinkText(
                  text: 'Sign Up',
                  onTap: () {},
                  fontSize: getProportionateScreenHeight(14),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
