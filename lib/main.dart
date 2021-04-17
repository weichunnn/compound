import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_navigation/app_navigator.dart';
import 'app_navigation/session_cubit.dart';
import 'auth/auth_repository.dart';
import 'theme.dart';
import 'secrets.dart';

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
      home: RepositoryProvider(
        create: (context) => AuthRepository(userPool),
        child: BlocProvider(
          create: (context) => SessionCubit(
            authRepo: context.read<AuthRepository>(),
          ),
          child: AppNavigator(),
        ),
      ),
    );
  }
}
