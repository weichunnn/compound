import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class CardOptions extends StatelessWidget {
  const CardOptions({
    Key key,
    this.text,
    this.selected,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final List selected;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(10),
        ),
      ),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size(0, 0),
        textStyle: selected.contains(text)
            ? TextStyle(fontWeight: FontWeight.bold)
            : TextStyle(),
        animationDuration: kAnimationDuration,
        backgroundColor:
            selected.contains(text) ? kPrimaryColor : kOptionsColor,
        primary: selected.contains(text) ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
