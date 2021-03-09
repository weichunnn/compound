import 'package:flutter/material.dart';

import 'components/body.dart';

class FaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Body(),
    );
  }
}
