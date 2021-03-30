import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/default_button.dart';

class FormModel {
  FormModel({
    this.email,
    this.password,
    this.confirmPassword,
  });

  String email;
  String password;
  String confirmPassword;
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final FormModel model = FormModel();

  bool _passwordSimilar = false;
  bool _obscureText = true;

  void _togglePasswordStatus() {
    setState(
      () {
        _obscureText = !_obscureText;
      },
    );
  }

  final emailValidator = MultiValidator(
    [
      RequiredValidator(
        errorText: 'Email is required',
      ),
      EmailValidator(
        errorText: 'Email must be valid',
      ),
    ],
  );

  final passwordValidator = MultiValidator(
    [
      RequiredValidator(
        errorText: 'Password is required',
      ),
      MinLengthValidator(
        8,
        errorText: 'Password must be at least 8 digits long',
      ),
      PatternValidator(
        r'([A-Z]+)',
        errorText: 'Password must have at least one uppercase letter',
      ),
      PatternValidator(
        r'(?=.*?[#?!@$%^&*-])',
        errorText: 'Password must have at least one special character',
      ),
    ],
  );

  // Attempted to use MatchValidator with RequiredValidator
  // Both are of diffrent type where MatchValidator returns a String and RequiredValidator returns a Function
  String confirmPasswordValidator(value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else {
      return MatchValidator(errorText: '').validateMatch(
        value,
        model.password,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailField(),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          passwordField(),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          confirmPasswordField(),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          DefaultButton(
            text: 'Sign Up',
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
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          EasyRichText(
            'By signing up, you confirm that you agree to out TnC and Privacy Policy.',
            defaultStyle: TextStyle(
              fontSize: getProportionateScreenHeight(12),
              color: kTextColor,
            ),
            patternList: [
              EasyRichTextPattern(
                targetString: 'TnC',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              EasyRichTextPattern(
                targetString: 'Privacy Policy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ],
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
      validator: emailValidator,
      decoration: InputDecoration(
        labelText: 'Email Adresss',
        hintText: 'example@gmail.com',
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
      onChanged: (value) => model.password = value,
      validator: passwordValidator,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            right: getProportionateScreenWidth(5),
          ),
          child: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: _togglePasswordStatus,
            color: kGreyColor,
          ),
        ),
      ),
    );
  }

  TextFormField confirmPasswordField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontSize: getProportionateScreenHeight(16),
      ),
      obscureText: true,
      onSaved: (value) => model.confirmPassword = value,
      onChanged: (value) => {
        model.confirmPassword = value,
        setState(() {
          _passwordSimilar = value == model.password ? true : false;
        })
      },
      validator: (value) => confirmPasswordValidator(value),
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Re-enter your password',
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            right: getProportionateScreenWidth(5),
          ),
          child: IconButton(
            icon: Icon(
              _passwordSimilar ? Icons.check : null,
            ),
            onPressed: _togglePasswordStatus,
            color: kSuccessColor,
          ),
        ),
      ),
    );
  }
}
