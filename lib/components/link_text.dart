import 'package:compound/size_config.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    Key key,
    this.text,
    this.onTap,
    this.fontSize,
  }) : super(key: key);

  final String text;
  final Function onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(fontSize),
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
