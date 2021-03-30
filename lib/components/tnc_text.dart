import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class TNCText extends StatelessWidget {
  final TextAlign textAlign;
  const TNCText({
    Key key,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyRichText(
      'By signing up, you agree to our Terms & Conditions and Privacy Policy.',
      textAlign: textAlign,
      defaultStyle: TextStyle(
        fontSize: getProportionateScreenHeight(12),
        color: kTextColor,
      ),
      patternList: [
        EasyRichTextPattern(
          targetString: 'Terms & Conditions',
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
    );
  }
}
