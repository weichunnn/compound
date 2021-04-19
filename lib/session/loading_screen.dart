import 'package:compound/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [kPrimaryColor, kSecondaryColor],
          ),
        ),
        child: Center(
          child: SvgPicture.asset('assets/images/compound_logo.svg'),
        ),
      ),
    );
  }
}
