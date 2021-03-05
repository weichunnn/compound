import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';
import '../../../constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  final String image, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        SvgPicture.asset(
          image,
          height: getProportionateScreenHeight(205),
          width: getProportionateScreenWidth(205),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(20),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kTextColor,
              fontSize: getProportionateScreenHeight(24),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(210),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kTextColor,
              fontSize: getProportionateScreenHeight(12),
            ),
          ),
        ),
      ],
    );
  }
}
