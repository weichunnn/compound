import 'package:flutter/material.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'sign_up_form.dart';
import '../../../components/central_divider.dart';
import '../../../components/social_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                'Create Account',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Start understanding your financials with us',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(14),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              SignUpForm(),
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
                  'Already have an account? Log In',
                  defaultStyle: TextStyle(
                    fontSize: getProportionateScreenHeight(14),
                    color: kTextColor,
                  ),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: 'Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/sign_in');
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
