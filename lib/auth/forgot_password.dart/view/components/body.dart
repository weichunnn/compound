import 'package:compound/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../size_config.dart';
import '../../../../components/normal_template.dart';
import '../../forgot_password_bloc.dart';
import '../../forgot_password_event.dart';
import '../../forgot_password_state.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

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
                  'Don\'t worry! Enter your email below to receive your password reset instructions',
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            emailField(formKey: _formKey),
            SizedBox(height: getProportionateScreenHeight(15)),
            DefaultButton(
              text: 'Sign Up',
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  context
                      .read<ForgotPasswordBloc>()
                      .add(ForgotPasswordSubmitted());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget emailField({GlobalKey formKey}) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
      return Form(
        key: formKey,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
            fontSize: getProportionateScreenHeight(16),
          ),
          onChanged: (value) => context
              .read<ForgotPasswordBloc>()
              .add(ForgotPasswordEmailChanged(email: value)),
          keyboardType: TextInputType.emailAddress,
          validator: state.emailValidator,
          decoration: InputDecoration(
            labelText: 'Email Adresss',
            hintText: 'example@gmail.com',
          ),
        ),
      );
    });
  }
}
