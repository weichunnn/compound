import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../../components/numeric_keyboard.dart';

class InputForm extends StatefulWidget {
  const InputForm({
    Key key,
  }) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final int fieldsCount = 4;
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(215),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              fieldsCount,
              (index) => buildCircle(index: index + 1),
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(100),
        ),
        buildKeyboard(),
      ],
    );
  }

  AnimatedContainer buildCircle({int index}) {
    return AnimatedContainer(
      height: getProportionateScreenWidth(25),
      width: getProportionateScreenWidth(25),
      duration: kAnimationDuration,
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
      ),
      decoration: BoxDecoration(
        color: text.length >= index ? kPrimaryColor : kGreyColor,
        shape: BoxShape.circle,
      ),
    );
  }

  NumericKeyboard buildKeyboard() {
    void _onKeyboardTap(value) {
      // Allow text to be updated up till the number of fieldsCount
      if (text.length < fieldsCount) {
        setState(
          () {
            text += value;
          },
        );
      }
      // Run when fieldsCount is reached
      if (text.length == fieldsCount) {
        print(text);
      }
    }

    return NumericKeyboard(
      onKeyboardTap: (value) => _onKeyboardTap(value),
      rightIcon: Icon(
        Icons.backspace,
        color: kTextColor,
        size: 45,
      ),
      rightButtonFn: () {
        // If statement to remove gesture errors
        if (text.length > 0) {
          setState(() {
            text = text.substring(0, text.length - 1);
          });
        }
      },
    );
  }
}
