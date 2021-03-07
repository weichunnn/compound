import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../size_config.dart';

class NormalTemplate extends StatelessWidget {
  const NormalTemplate({
    Key key,
    this.image,
    this.title,
    this.caption,
  }) : super(key: key);

  final String image;
  final String title;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: getProportionateScreenHeight(35),
          ),
          child: SvgPicture.asset(image),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(24),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          caption,
          style: TextStyle(
            fontSize: getProportionateScreenHeight(12),
            color: kTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
