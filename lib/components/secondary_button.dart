import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: getProportionateScreenWidth(265),
        height: getProportionateScreenHeight(50),
        child: OutlinedButton(
          child: Text(
            text,
          ),
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: kPrimaryColor),
            backgroundColor: Colors.white,
            primary: kPrimaryColor,
            textStyle: TextStyle(
              fontSize: getProportionateScreenHeight(17.5),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
