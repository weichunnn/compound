import 'package:flutter/material.dart';

import 'routes.dart';
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
      initialRoute: '/',
      routes: routes,
    );
  }
}
