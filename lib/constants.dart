import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFF7F6FB);
const kPrimaryColor = Color(0xFF9B79FF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    kSecondaryColor,
    kPrimaryColor,
  ],
);
const kSecondaryColor = Color(0xFF545BEA);
const kTextColor = Color(0xFF525252);

const kAnimationDuration = Duration(milliseconds: 250);
