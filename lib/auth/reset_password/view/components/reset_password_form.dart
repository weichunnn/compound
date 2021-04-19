import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../../components/default_button.dart';
import '../../reset_password_bloc.dart';
import '../../reset_password_event.dart';
import '../../reset_password_state.dart';

class ResetPasswordForm extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          otpField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          passwordField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          confirmPasswordField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          DefaultButton(
            text: 'Reset Password',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                context.read<ResetPasswordBloc>().add(ResetPasswordSubmitted());
              }
            },
          ),
        ],
      ),
    );
  }

  Widget otpField() {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        builder: (context, state) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(16),
        ),
        onChanged: (value) => context.read<ResetPasswordBloc>().add(
              ResetPasswordOtpChanged(otp: value),
            ),
        obscureText: true,
        obscuringCharacter: '*',
        validator: state.otpValidator,
        decoration: InputDecoration(
          labelText: 'OTP',
          hintText: '* * * * * *',
        ),
      );
    });
  }

  Widget passwordField() {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        builder: (context, state) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(16),
        ),
        obscureText: state.obscurePassword,
        onChanged: (value) => context.read<ResetPasswordBloc>().add(
              ResetPasswordPasswordChanged(password: value),
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
                context.read<ResetPasswordBloc>().add(
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
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        builder: (context, state) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(16),
        ),
        obscureText: true,
        onChanged: (value) => context.read<ResetPasswordBloc>().add(
              ResetPasswordConfirmPasswordChanged(confirmPassword: value),
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
