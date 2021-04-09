import 'package:compound/size_config.dart';
import 'package:compound/welcome/splash/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/body.dart';
import '../../../components/link_text.dart';
import '../../welcome_navigation/welcome_cubit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: LinkText(
          text: 'Back',
          onTap: () {
            context.read<WelcomeCubit>().showWelcome();
          },
          fontSize: getProportionateScreenHeight(16),
        ),
      ),
      body: BlocProvider(
        create: (context) => SplashCubit(),
        child: Body(),
      ),
    );
  }
}
