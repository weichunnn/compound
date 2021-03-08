import 'package:flutter/material.dart';

import 'components/body.dart';

class PhoneVerificationScreen extends StatelessWidget {
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
