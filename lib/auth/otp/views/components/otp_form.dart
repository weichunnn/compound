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
                    context.read<OtpBloc>().add(ResendConfirmationEmail());
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
    final size = getProportionateScreenHeight(45);
    final TextEditingController _pinPutController = TextEditingController();
    final FocusNode _pinPutFocusNode = FocusNode();

    return Container(
      alignment: Alignment.center,
      height: getProportionateScreenHeight(75),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(getProportionateScreenHeight(5)),
      child: PinPut(
        fieldsCount: 6,
        onSubmit: (String otp) =>
            context.read<OtpBloc>().add(OtpSubmitted(otp: otp)),
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        preFilledWidget: Align(
          alignment: Alignment.bottomCenter,
          child: Divider(
            color: kPrimaryColor,
            thickness: 3.5,
            indent: 7.5,
            endIndent: 7.5,
          ),
        ),
        textStyle: TextStyle(fontSize: getProportionateScreenHeight(28)),
        eachFieldPadding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(5),
          horizontal: getProportionateScreenWidth(1),
        ),
        eachFieldMargin: EdgeInsets.all(0),
        eachFieldHeight: size,
        eachFieldWidth: size,
        inputDecoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          counterText: '',
        ),
        withCursor: true,
        pinAnimationType: PinAnimationType.scale,
        animationDuration: kAnimationDuration,
      ),
    );
  }
}
