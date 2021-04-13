import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../auth_repository.dart';
import '../reset_password_bloc.dart';
import 'components/body.dart';
import '../../../auth/auth_navigation/auth_cubit.dart';

class ResetPasswordScreen extends StatelessWidget {
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
              context.read<AuthCubit>().showForgotPassword();
            },
          ),
        ),
        body: BlocProvider(
          create: (context) => ResetPasswordBloc(
            authCubit: context.read<AuthCubit>(),
            authRepo: context.read<AuthRepository>(),
          ),
          child: Body(),
        ),
      ),
    );
  }
}
