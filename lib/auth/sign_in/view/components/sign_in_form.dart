import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../../components/default_button.dart';
import '../../../../components/link_text.dart';
import '../../sign_in_bloc.dart';
import '../../sign_in_event.dart';
import '../../sign_in_state.dart';
import '../../../../auth/auth_navigation/auth_cubit.dart';

class SignInForm extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailField(),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          passwordField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: LinkText(
                  text: 'Forgot Password?',
                  onTap: () {
                    context.read<AuthCubit>().showForgotPassword();
                  },
                  fontSize: getProportionateScreenHeight(12),
                ),
              )
            ],
          ),
          DefaultButton(
            text: 'Log In',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                context.read<LoginBloc>().add(LoginSubmitted());
              }
            },
          ),
        ],
      ),
    );
  }

  Widget passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(16),
        ),
        onChanged: (value) => context.read<LoginBloc>().add(
              LoginPasswordChanged(password: value),
            ),
        obscureText: state.obscurePassword,
        validator: state.passwordValidator,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          suffixIcon: Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(5),
            ),
            child: IconButton(
              icon: Icon(
                state.obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                context.read<LoginBloc>().add(
                      ObscurePassword(obscurePassword: !state.obscurePassword),
                    );
              },
              color: kGreyColor,
            ),
          ),
        ),
      );
    });
  }

  Widget emailField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(16),
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => context.read<LoginBloc>().add(
              LoginEmailChanged(email: value),
            ),
        validator: state.emailValidator,
        decoration: InputDecoration(
          labelText: 'Email Adresss',
          hintText: 'example@gmail.com',
        ),
      );
    });
  }
}
