// import 'package:compound/auth/forgot_password.dart/forgot_password_event.dart';
// import 'package:compound/auth/phone_verification/phone_verification_event.dart';
// import 'package:flutter/material.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// import '../size_config.dart';
// import 'default_button.dart';

// class PhoneInputForm extends StatelessWidget {
//   static final _formKey = GlobalKey<FormState>();
//   final dynamic state;
//   final dynamic bloc;
//   PhoneInputForm({this.state, this.bloc});

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           phoneNumberField(),
//           SizedBox(height: getProportionateScreenHeight(25)),
//           submitButton(context),
//         ],
//       ),
//     );
//   }

//   Widget submitButton(BuildContext context) {
//     return DefaultButton(
//       text: state.forVerification ? 'Send Code' : 'Recover Code',
//       onPressed: () {
//         if (_formKey.currentState.validate()) {
//           if (state.forVerification) {
//             bloc.add(PhoneVerificationSubmitted());
//           } else {
//             bloc.add(ForgotPasswordPhoneNumberSubmitted());
//           }
//         }
//       },
//     );
//   }

//   Widget phoneNumberField() {
//     String phoneNumber;
//     String userInput;
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
//         border: Border.all(
//           width: 2.0,
//           color: state.borderColor,
//         ),
//       ),
//       child: InternationalPhoneNumberInput(
//         keyboardType: TextInputType.phone,
//         autoValidateMode: AutovalidateMode.onUserInteraction,
//         spaceBetweenSelectorAndTextField: 0,
//         onInputChanged: (value) => {
//           // Sanitization to remove leading zeros
//           userInput = value.phoneNumber.replaceAll(value.dialCode, ''),
//           phoneNumber = value.dialCode + userInput,
//           state.forVerification
//               ? bloc.add(
//                   PhoneVerificationNumberChanged(phoneNumber: phoneNumber),
//                 )
//               : bloc.add(
//                   ForgotPasswordPhoneNumberChanged(phoneNumber: phoneNumber),
//                 )
//         },
//         selectorTextStyle: TextStyle(
//           fontSize: getProportionateScreenHeight(16),
//           color: Colors.black,
//         ),
//         textStyle: TextStyle(
//           fontSize: getProportionateScreenHeight(16),
//         ),
//         inputDecoration: InputDecoration(
//           // Prevent error text from pushing input box upwards
//           errorStyle: TextStyle(height: 0),
//           // Make Input closer to Selector
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: getProportionateScreenHeight(5),
//             vertical: getProportionateScreenHeight(18),
//           ),
//           hintText: 'Phone Number',
//           focusedBorder: InputBorder.none,
//           enabledBorder: InputBorder.none,
//           errorBorder: InputBorder.none,
//           focusedErrorBorder: InputBorder.none,
//         ),
//         validator: (value) => state.phoneValidator(value),
//         // searchBoxDecoration: InputDecoration(
//         //   labelText: 'Country Name or Dial Code',
//         // ),
//         // Disable Selector and force Malaysia as only Country Code
//         countries: ['MY'],
//       ),
//     );
//   }
// }
