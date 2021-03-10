import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../../components/numeric_keyboard.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  String text = '';
  final int fieldsCount = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PinInput(
          text: text,
          fieldsCount: fieldsCount,
        ),
        SizedBox(
          height: getProportionateScreenHeight(100),
        ),
        buildKeyboard(),
      ],
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
        // Call to NextPage
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

class PinInput extends StatelessWidget {
  const PinInput({
    Key key,
    this.text,
    this.fieldsCount,
  }) : super(key: key);

  final String text;
  final int fieldsCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(215),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          fieldsCount,
          (index) => buildCircle(index: index + 1),
        ),
      ),
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
}
