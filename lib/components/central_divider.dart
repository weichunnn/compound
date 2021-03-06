import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class CentralDivider extends StatelessWidget {
  const CentralDivider({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: kTextColor,
            thickness: 1,
            endIndent: 20,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenHeight(14),
          ),
        ),
        Expanded(
          child: Divider(
            color: kTextColor,
            thickness: 1,
            indent: 20,
          ),
        ),
      ],
    );
  }
}
