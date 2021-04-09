import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class IntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialization for Sizing Configs
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
