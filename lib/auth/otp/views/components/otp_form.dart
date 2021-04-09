import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

import '../../../../size_config.dart';
import '../../../../constants.dart';
import '../../otp_bloc.dart';
import '../../otp_event.dart';
import '../../otp_state.dart';

class OtpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PinInput(),
        SizedBox(height: getProportionateScreenHeight(15)),
        buildTimer(),
      ],
    );
  }

  Widget buildTimer() {
    return BlocBuilder<OtpBloc, OtpState>(builder: (context, state) {
      int _counter = state.countdown;
      return EasyRichText(
        state.showResend ? 'Resend' : 'Please wait $_counter seconds to resend',
        defaultStyle: TextStyle(
          fontSize: getProportionateScreenHeight(14),
          color: kTextColor,
        ),
        patternList: [
          EasyRichTextPattern(
            targetString: state.showResend ? 'Resend' : '$_counter',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
            recognizer: state.showResend
                ? (TapGestureRecognizer()
                  ..onTap = () {
                    context.read<OtpBloc>().add(StartTimer());
                  })
                : null,
          ),
        ],
      );
    });
  }
}

class PinInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = getProportionateScreenHeight(60);
    final TextEditingController _pinPutController = TextEditingController();
    final FocusNode _pinPutFocusNode = FocusNode();

    return PinPut(
      fieldsCount: 4,
      onSubmit: (String otp) =>
          context.read<OtpBloc>().add(OtpSubmitted(otp: otp)),
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
      textStyle: TextStyle(fontSize: getProportionateScreenHeight(24)),
      eachFieldPadding: EdgeInsets.all(getProportionateScreenHeight(10)),
      eachFieldMargin: EdgeInsets.all(getProportionateScreenWidth(5)),
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

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
    );
  }
}
