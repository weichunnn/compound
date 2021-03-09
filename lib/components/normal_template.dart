import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../size_config.dart';

class NormalTemplate extends StatelessWidget {
  const NormalTemplate({
    Key key,
    this.image,
    this.title,
    this.caption,
    this.bolded = '',
  }) : super(key: key);

  final String image;
  final String title;
  final String caption;
  final String bolded;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: getProportionateScreenHeight(35),
          ),
          child: SvgPicture.asset(image),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(24),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        EasyRichText(
          caption,
          defaultStyle: TextStyle(
            fontSize: getProportionateScreenHeight(14),
            color: kTextColor,
          ),
          textAlign: TextAlign.center,
          patternList: (bolded.isNotEmpty == true)
              ? [
                  EasyRichTextPattern(
                    targetString: bolded,
                    hasSpecialCharacters: true,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ]
              : null,
        ),
      ],
    );
  }
}
