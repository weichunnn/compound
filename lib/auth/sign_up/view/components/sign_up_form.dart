import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../../components/default_button.dart';
import '../../../../components/tnc_text.dart';
import '../../sign_up_bloc.dart';
import '../../sign_up_event.dart';
import '../../sign_up_state.dart';

class SignUpForm extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          passwordField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          confirmPasswordField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          DefaultButton(
            text: 'Sign Up',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                context.read<SignUpBloc>().add(SignUpSubmitted());
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          TNCText(textAlign: TextAlign.start),
        ],
      ),
    );
  }

  Widget emailField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(16),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: state.emailValidator,
        decoration: InputDecoration(
          labelText: 'Email Adresss',
          hintText: 'example@gmail.com',
        ),
      );
    });
  }

  Widget passwordField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(16),
        ),
        obscureText: state.obscurePassword,
        onChanged: (value) => context.read<SignUpBloc>().add(
              SignUpPasswordChanged(password: value),
            ),
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
                context.read<SignUpBloc>().add(
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

  Widget confirmPasswordField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(16),
        ),
        obscureText: true,
        onChanged: (value) => context.read<SignUpBloc>().add(
              SignUpConfirmPasswordChanged(confirmPassword: value),
            ),
        validator: (value) => state.confirmPasswordValidator(value),
        decoration: InputDecoration(
          labelText: 'Confirm Password',
          hintText: 'Re-enter your password',
          suffixIcon: Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(5),
            ),
            child: Icon(
              state.passwordSimilar() ? Icons.check : null,
              color: kSuccessColor,
            ),
          ),
        ),
      );
    });
  }
}
