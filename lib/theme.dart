import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Montserrat',
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: true,
    iconTheme: IconThemeData(color: kTextColor),
    color: Colors.transparent,
    elevation: 0,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: kTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}
