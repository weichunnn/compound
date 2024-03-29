import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../../components/numeric_keyboard.dart';
import '../../../../components/toast.dart';

class InputForm extends StatefulWidget {
  const InputForm({
    Key key,
  }) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final int fieldsCount = 4;
  // State of Form [1 = Setup, 2 = Confirmation]
  int state = 1;
  Map<int, String> pinCodes = {
    1: '',
    2: '',
  };

  bool _isToastShown = false;

  void putShared(String key, bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, val);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getAvailableHeight(),
      child: Column(
        children: [
          Spacer(),
          Text(
            state == 1 ? 'Enter your Pin Code' : 'Re-Enter your Pin Code',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
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
            height: getProportionateScreenHeight(50),
          ),
          Spacer(),
          buildKeyboard(),
          Spacer(),
        ],
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
        color: pinCodes[state].length >= index ? kPrimaryColor : kGreyColor,
        shape: BoxShape.circle,
      ),
    );
  }

  NumericKeyboard buildKeyboard() {
    void _onKeyboardTap(value) async {
      // Allow pin to be updated up till the number of fieldsCount
      if (pinCodes[state].length < fieldsCount) {
        setState(
          () {
            pinCodes[state] += value;
          },
        );
      }
      // Run when fieldsCount is reached
      if (pinCodes[state].length == fieldsCount) {
        print(pinCodes[state]);
        if (state == 1) {
          state = 2;
        } else {
          // Check if Pin are Equivalent
          if (pinCodes[1] == pinCodes[2]) {
            putShared('Pin Code', true);
            Navigator.pushNamed(context, '/2fa');
          } else {
            // To prevent toast message from showing up duplicates
            if (_isToastShown) {
              return;
            }
            _isToastShown = true;
            await toast(
              context: context,
              text: 'Pin Code is not identical. Please try again.',
            );
            _isToastShown = false;
          }
        }
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
        if (pinCodes[state].length > 0) {
          setState(() {
            pinCodes[state] =
                pinCodes[state].substring(0, pinCodes[state].length - 1);
          });
        }
      },
    );
  }
}
