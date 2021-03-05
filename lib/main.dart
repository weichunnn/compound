import 'package:flutter/material.dart';

import 'screens/welcome/welcome_screen.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Compound',
      theme: theme(),
      home: WelcomeScreen(),
    );
  }
}
