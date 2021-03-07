import 'package:flutter/material.dart';
import 'dart:ui';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;
  static EdgeInsets safeArea;
  static double appBarSize;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    safeArea = MediaQueryData.fromWindow(window).padding;
    appBarSize = AppBar().preferredSize.height;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the standard layout height
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the standard layout width
  return (inputWidth / 375.0) * screenWidth;
}

// Get Height of content available without Notification Bar, App Bar and Bottom Safe Area Margin
double getAvailableHeight() {
  return SizeConfig.screenHeight -
      (SizeConfig.appBarSize +
          SizeConfig.safeArea.top +
          SizeConfig.safeArea.bottom);
}
