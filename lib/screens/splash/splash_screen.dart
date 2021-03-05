import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/body.dart';
import '../../components/link_text.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: LinkText(
          text: 'Back',
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          fontSize: 20,
        ),
      ),
      body: Body(),
    );
  }
}
