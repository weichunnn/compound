import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';
import '../size_config.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 30.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 5,
      children: [
        SpinKitFoldingCube(
          color: kPrimaryColor,
        ),
        SizedBox(height: 30),
        Text(
          'Loading',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenHeight(16),
          ),
        ),
      ],
    );
  }
}
