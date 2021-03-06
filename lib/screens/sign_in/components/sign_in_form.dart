import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/primary_button.dart';
import '../../../components/link_text.dart';

class FormModel {
  String email;
  String password;

  FormModel({this.email, this.password});
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final FormModel model = FormModel();

  bool _obscureText = true;
  // Toggles the password show status
  void _togglePasswordStatus() {
    setState(
      () {
        _obscureText = !_obscureText;
      },
    );
  }

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
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: LinkText(
                  text: 'Forgot Password?',
                  onTap: () {},
                  fontSize: getProportionateScreenHeight(14),
                ),
              )
            ],
          ),
          PrimaryButton(
            text: 'Log In',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // Insert API call to backend for validation
                ScaffoldMessenger.of(_formKey.currentContext).showSnackBar(
                  SnackBar(
                    content: Text('Processing'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField passwordField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontSize: getProportionateScreenHeight(16),
      ),
      obscureText: _obscureText,
      onSaved: (value) => model.password = value,
      validator: MultiValidator(
        [
          RequiredValidator(
            errorText: 'Password is required',
          ),
        ],
      ),
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: _togglePasswordStatus,
          color: kGreyColor,
        ),
      ),
    );
  }

  TextFormField emailField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontSize: getProportionateScreenHeight(16),
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => model.email = value,
      validator: MultiValidator(
        [
          RequiredValidator(
            errorText: 'Email is required',
          ),
          EmailValidator(
            errorText: 'Email must be valid',
          ),
        ],
      ),
      decoration: InputDecoration(
        labelText: 'Email Adresss',
        hintText: 'example@gmail.com',
      ),
    );
  }
}