import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    fontFamily: 'Montserrat',
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
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
    backgroundColor: Colors.transparent,
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

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: kGreyColor,
      width: 2.0,
    ),
    gapPadding: 10,
  );

  OutlineInputBorder defaultErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: kErrorColor,
      width: 2.0,
    ),
    gapPadding: 10,
  );

  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 20,
    ),
    border: defaultBorder,
    enabledBorder: defaultBorder,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 2.0,
      ),
      gapPadding: 10,
    ),
    errorBorder: defaultErrorBorder,
    focusedErrorBorder: defaultErrorBorder,
  );
}
