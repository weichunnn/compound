import 'package:compound/size_config.dart';
import 'package:flutter/material.dart';

import 'input_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          Spacer(),
          Text(
            'Enter your Pin Code',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          InputForm(),
          Spacer(),
        ],
      ),
    );
  }
}
