import 'package:flutter/material.dart';

import '../size_config.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    Key key,
    this.height,
    this.body,
  }) : super(key: key);

  final double height;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
      child: Container(
        height: height,
        padding: EdgeInsets.all(getProportionateScreenHeight(10)),
        child: body,
      ),
    );
  }
}
