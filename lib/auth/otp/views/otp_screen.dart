import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth_navigation/auth_cubit.dart';
import '../../auth_repository.dart';
import '../otp_bloc.dart';
import '../otp_event.dart';
import '../ticker.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
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
              context.read<AuthCubit>().forVerification
                  ? context.read<AuthCubit>().showPhoneVerification()
                  : context.read<AuthCubit>().showForgotPassword();
            },
          ),
        ),
        body: BlocProvider(
          create: (context) => OtpBloc(
            ticker: Ticker(),
            authRepo: context.read<AuthRepository>(),
            authCubit: context.read<AuthCubit>(),
          )..add(StartTimer()),
          child: Body(),
        ),
      ),
    );
  }
}
