import 'package:flutter/material.dart';

import 'components/body.dart';

class SetupPinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        title: Text('Setup Pin'),
      ),
      body: Body(),
    );
  }
}
