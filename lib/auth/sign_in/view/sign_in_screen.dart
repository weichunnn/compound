import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/auth_navigation/auth_cubit.dart';
import '../../auth_repository.dart';
import '../sign_in_bloc.dart';
import 'components/body.dart';
import '../../../welcome/welcome_navigation/welcome_cubit.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 75,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              context.read<WelcomeCubit>().showWelcome();
            },
          ),
        ),
        body: BlocProvider(
          create: (context) => LoginBloc(
            authRepo: context.read<AuthRepository>(),
            authCubit: context.read<AuthCubit>(),
          ),
          child: Body(),
        ),
      ),
    );
  }
}
