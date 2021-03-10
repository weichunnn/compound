import 'package:flutter/material.dart';

import 'input_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 35),
      child: InputForm(),
    );
  }
}
