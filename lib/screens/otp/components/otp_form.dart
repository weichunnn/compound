import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

import '../../../size_config.dart';
import '../../../constants.dart';
import '../../../components/link_text.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  bool showResend = false;
  int _counter = 60;
  Timer _timer;

  //Start the timer on Page Load
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PinInput(),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        buildTimer()
      ],
    );
  }

  void _startTimer() {
    _counter = 60;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          if (_counter > 0) {
            _counter--;
          } else {
            _timer.cancel();
            setState(
              () {
                showResend = true;
              },
            );
          }
        });
      },
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        showResend
            ? LinkText(
                text: 'Resend',
                onTap: () {
                  // Resend OTP API
                  setState(
                    () {
                      showResend = false;
                      _startTimer();
                    },
                  );
                },
                fontSize: getProportionateScreenHeight(14),
              )
            : EasyRichText(
                'Please wait $_counter seconds to resend',
                defaultStyle: TextStyle(
                  fontSize: getProportionateScreenHeight(14),
                  color: kTextColor,
                ),
                patternList: [
                  EasyRichTextPattern(
                    targetString: '$_counter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}

class PinInput extends StatelessWidget {
  const PinInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getProportionateScreenHeight(60);
    final TextEditingController _pinPutController = TextEditingController();
    final FocusNode _pinPutFocusNode = FocusNode();

    return PinPut(
      fieldsCount: 4,
      onSubmit: (String pin) => {},
      focusNode: _pinPutFocusNode,
      controller: _pinPutController,
      preFilledWidget: Align(
        alignment: Alignment.bottomCenter,
        child: Divider(
          color: kPrimaryColor,
          thickness: 2.5,
          indent: 7.5,
          endIndent: 7.5,
        ),
      ),
      textStyle: TextStyle(
        fontSize: getProportionateScreenHeight(24),
      ),
      eachFieldPadding: EdgeInsets.all(
        getProportionateScreenHeight(10),
      ),
      eachFieldMargin: EdgeInsets.all(
        getProportionateScreenWidth(5),
      ),
      eachFieldHeight: size,
      eachFieldWidth: size,
      submittedFieldDecoration: boxDecoration(),
      selectedFieldDecoration: boxDecoration(),
      followingFieldDecoration: boxDecoration(),
      inputDecoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        counterText: '',
      ),
      withCursor: true,
      pinAnimationType: PinAnimationType.scale,
      animationDuration: kAnimationDuration,
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(
        getProportionateScreenWidth(20),
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.transparent,
      ),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(
        getProportionateScreenWidth(10),
      ),
    );
  }
}



// Replaced by Flutter Plugin
// class _OtpFormState extends State<OtpForm> {
//   FocusNode pin1FocusNode;
//   FocusNode pin2FocusNode;
//   FocusNode pin3FocusNode;
//   FocusNode pin4FocusNode;
//   List<FocusNode> nodeList;

//   @override
//   void initState() {
//     super.initState();
//     pin1FocusNode = FocusNode();
//     pin2FocusNode = FocusNode();
//     pin3FocusNode = FocusNode();
//     pin4FocusNode = FocusNode();

//     nodeList = [
//       pin1FocusNode,
//       pin2FocusNode,
//       pin3FocusNode,
//       pin4FocusNode,
//     ];
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     pin1FocusNode.dispose();
//     pin2FocusNode.dispose();
//     pin3FocusNode.dispose();
//     pin4FocusNode.dispose();
//   }

//   void toggleField(String value, int currentNodeIndex) {
//     if (value.length == 1) {
//       nodeList[currentNodeIndex + 1].requestFocus();
//     } else {
//       nodeList[currentNodeIndex - 1].requestFocus();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         children: [
//           SizedBox(
//             width: SizeConfig.screenWidth * 0.75,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: nodeList
//                       .asMap()
//                       .entries
//                       .map(
//                         (node) => SizedBox(
//                           width: getProportionateScreenWidth(60),
//                           child: TextFormField(
//                             controller: TextEditingController(),
//                             autofocus:
//                                 (node.value == pin1FocusNode) ? true : false,
//                             focusNode: node.value,
//                             style: TextStyle(
//                               fontSize: getProportionateScreenHeight(24),
//                             ),
//                             keyboardType: TextInputType.number,
//                             textAlign: TextAlign.center,
//                             decoration: otpInputDecoration,
//                             onChanged: (value) {
//                               print('hehe');
//                               toggleField(value, node.key);
//                             },
//                           ),
//                         ),
//                       )
//                       .toList(),
//                 ),
//                 SizedBox(
//                   width: getProportionateScreenWidth(60),
//                   child: TextFormField(
//                     autofocus: true,
//                     focusNode: pin1FocusNode,
//                     style: TextStyle(
//                       fontSize: getProportionateScreenHeight(24),
//                     ),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: otpInputDecoration,
//                     onChanged: (value) {
//                       toggleField(value, nodeList[0]);
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   width: getProportionateScreenWidth(60),
//                   child: TextFormField(
//                     focusNode: pin2FocusNode,
//                     style: TextStyle(
//                       fontSize: getProportionateScreenHeight(24),
//                     ),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: otpInputDecoration,
//                     onChanged: (value) {
//                       toggleField(value, pin3FocusNode);
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   width: getProportionateScreenWidth(60),
//                   child: TextFormField(
//                     focusNode: pin3FocusNode,
//                     style: TextStyle(
//                       fontSize: getProportionateScreenHeight(24),
//                     ),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: otpInputDecoration,
//                     onChanged: (value) {
//                       print(value);
//                       toggleField(value, pin4FocusNode);
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   width: getProportionateScreenWidth(60),
//                   child: TextFormField(
//                     focusNode: pin4FocusNode,
//                     style: TextStyle(
//                       fontSize: getProportionateScreenHeight(24),
//                     ),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: otpInputDecoration,
//                     onChanged: (value) {
//                       if (value.length == 1) {
//                         pin4FocusNode.unfocus();
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
// final otpInputDecoration = InputDecoration(
//   filled: true,
//   fillColor: Colors.white,
//   contentPadding: EdgeInsets.all(
//     getProportionateScreenHeight(15),
//   ),
//   border: outlineInputBorder(),
//   focusedBorder: outlineInputBorder(),
//   enabledBorder: outlineInputBorder(),
// );
