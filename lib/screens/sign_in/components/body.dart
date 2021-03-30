import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'sign_in_form.dart';
import '../../../components/central_divider.dart';
import '../../../components/social_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 35, right: 35, bottom: 20),
      child: SingleChildScrollView(
        child: SizedBox(
          height: getAvailableHeight(),
          child: Column(
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Ready to take charge of your finance again?',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(14),
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
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  bottom: getProportionateScreenHeight(25),
                ),
                child: EasyRichText(
                  'Don\'t have an account? Sign Up',
                  defaultStyle: TextStyle(
                    fontSize: getProportionateScreenHeight(14),
                    color: kTextColor,
                  ),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: 'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/sign_up');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
