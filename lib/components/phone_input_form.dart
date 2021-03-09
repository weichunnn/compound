import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../constants.dart';
import '../size_config.dart';
import 'default_button.dart';

class PhoneInputForm extends StatefulWidget {
  const PhoneInputForm({
    Key key,
    this.forVerification = false,
  }) : super(key: key);

  final bool forVerification;

  @override
  _PhoneInputFormState createState() => _PhoneInputFormState();
}

class _PhoneInputFormState extends State<PhoneInputForm> {
  final _formKey = GlobalKey<FormState>();
  // final initial = PhoneNumber(isoCode: 'MY');

  String phoneNumber;
  String userInput;
  Color borderColor = kGreyColor;

  String phoneValidator(value) {
    if (value.isEmpty) {
      // To cater for submitting form prior to any Input
      setState(() {
        borderColor = kErrorColor;
      });
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
            text: widget.forVerification ? 'Send Code' : 'Recover Code',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (widget.forVerification) {
                  // Insert API call to backend for validation
                  ScaffoldMessenger.of(_formKey.currentContext).showSnackBar(
                    SnackBar(
                      content: Text(phoneNumber),
                    ),
                  );
                  Navigator.pushNamed(
                    context,
                    '/otp',
                    arguments: {
                      'phoneNumber': phoneNumber,
                    },
                  );
                } else {
                  // Insert API call to backend for validation
                  ScaffoldMessenger.of(_formKey.currentContext).showSnackBar(
                    SnackBar(
                      content: Text('For Recovering Code'),
                    ),
                  );
                }
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
        // initialValue: initial,
        selectorTextStyle: TextStyle(
          fontSize: getProportionateScreenHeight(16),
          color: Colors.black,
        ),
        textStyle: TextStyle(
          fontSize: getProportionateScreenHeight(18),
        ),
        inputDecoration: InputDecoration(
          // Prevent error text from pushing input box upwards
          errorStyle: TextStyle(
            height: 0,
          ),
          // Make Input closer to Selector
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(5),
            vertical: getProportionateScreenHeight(15),
          ),
          hintText: 'Phone Number',
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        validator: phoneValidator,
        // searchBoxDecoration: InputDecoration(
        //   labelText: 'Country Name or Dial Code',
        // ),
        // Disable Selector and force Malaysia as only Country Code
        countries: ['MY'],
      ),
    );
  }
}
