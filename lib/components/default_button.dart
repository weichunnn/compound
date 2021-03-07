import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.onPressed,
    this.secondary = false,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  final bool secondary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: getProportionateScreenWidth(265),
        height: getProportionateScreenHeight(50),
        child: TextButton(
          child: Text(
            text,
          ),
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: secondary ? Colors.white : kPrimaryColor,
              side: secondary ? BorderSide(color: kPrimaryColor) : null,
              primary: secondary ? kPrimaryColor : Colors.white,
              textStyle: TextStyle(
                fontSize: getProportionateScreenHeight(17.5),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )),
        ),
      ),
    );
  }
}
