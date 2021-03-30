import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';
import '../../../components/default_button.dart';
import '../../../components/tnc_text.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 35, right: 35, bottom: 20),
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
            child: TNCText(textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
