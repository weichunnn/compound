import 'package:flutter/material.dart';

import '../size_config.dart';

class ColoredIcon extends StatelessWidget {
  const ColoredIcon({
    Key key,
    this.backgroundColor,
    this.icon,
    this.color,
  }) : super(key: key);

  final Color backgroundColor;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(42),
      width: getProportionateScreenHeight(42),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
