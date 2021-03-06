import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';
import '../../../components/default_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: getProportionateScreenWidth(310),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.5),
                    child: Text(
                      'Compound',
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(36),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.5),
                    child: Text(
                      'Take control of your finances through deep insights.',
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(17.5),
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          SvgPicture.asset(
            'assets/images/welcome.svg',
            height: getProportionateScreenHeight(315),
            width: getProportionateScreenWidth(315),
          ),
          Spacer(),
          SizedBox(
            height: getProportionateScreenHeight(140),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.pushNamed(context, '/splash');
                  },
                ),
                DefaultButton(
                  text: 'Log In',
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign_in');
                  },
                  secondary: true,
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            width: getProportionateScreenWidth(235),
            child: Text(
              'By signing up,  you agree to our Terms & Conditions and Privacy Policy.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenHeight(12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
