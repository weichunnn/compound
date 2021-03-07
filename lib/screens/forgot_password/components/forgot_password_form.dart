import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/default_button.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final initial = PhoneNumber(isoCode: 'MY');

  String phoneNumber;
  String userInput;
  Color borderColor = kGreyColor;

  String phoneValidator(value) {
    if (value.isEmpty) {
      return '';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          phoneNumberField(),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          DefaultButton(
            text: 'Recover Code',
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

  Container phoneNumberField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
        border: Border.all(
          width: 2.0,
          color: borderColor,
        ),
      ),
      child: InternationalPhoneNumberInput(
        autoValidateMode: AutovalidateMode.onUserInteraction,
        spaceBetweenSelectorAndTextField: 0,
        onInputChanged: (value) => {
          phoneNumber = value.phoneNumber,
          userInput = phoneNumber.replaceAll(value.dialCode, ''),
          // RegExp(r'[A-Za-z]').hasMatch(userInput)) failed because input had been sanitized
          // Don't need to check for alphabets because given keyboard is numerical
          setState(() {
            borderColor = userInput.isEmpty ? kErrorColor : kPrimaryColor;
          })
        },
        // Internal call for saving the phone number is using a future, so saving will yield null, reported as an Issue
        // onChanged is used to save the latest
        onSaved: (value) => phoneNumber = value.phoneNumber,
        initialValue: initial,
        selectorTextStyle: TextStyle(
          fontSize: getProportionateScreenHeight(16),
        ),
        textStyle: TextStyle(
          fontSize: getProportionateScreenHeight(16),
        ),
        inputDecoration: InputDecoration(
          // Prevent error text from pushing input box upwards
          errorStyle: TextStyle(
            height: 0,
          ),
          hintText: 'Phone Number',
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        validator: phoneValidator,
        searchBoxDecoration: InputDecoration(
          labelText: 'Country Name or Dial Code',
        ),
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.DIALOG,
        ),
      ),
    );
  }
}
