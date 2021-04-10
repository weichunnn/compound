import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../size_config.dart';
import '../../../../components/normal_template.dart';
import '../../forgot_password_bloc.dart';
import '../../forgot_password_state.dart';
import '../../../../components/phone_input_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 35, right: 35, bottom: 20),
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            NormalTemplate(
              image: 'assets/images/forgot_password.svg',
              title: 'Forgot your password?',
              caption:
                  'Don\'t worry! Enter your phone number below to receive your password reset instructions',
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
              builder: (context, state) {
                return PhoneInputForm(
                  bloc: context.read<ForgotPasswordBloc>(),
                  state: state,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
