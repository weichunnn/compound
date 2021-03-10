import 'package:flutter/material.dart';

import '../constants.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  /// Color of the text [default = kTextColor]
  final Color textColor;

  /// Display a custom right icon
  final Icon rightIcon;

  /// Action to trigger when right button is pressed
  final Function rightButtonFn;

  /// Display a custom left icon
  final Icon leftIcon;

  /// Action to trigger when left button is pressed
  final Function leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceBetween]
  final MainAxisAlignment mainAxisAlignment;

  /// Padding for Keyboard
  final EdgeInsets padding;

  /// Height for Button [default = 75]
  final double buttonHeight;

  /// Width for Button [default = 55]
  final double buttonWidth;

  NumericKeyboard({
    Key key,
    @required this.onKeyboardTap,
    this.textColor = kTextColor,
    this.rightButtonFn,
    this.rightIcon,
    this.leftButtonFn,
    this.leftIcon,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.padding,
    this.buttonHeight = 75,
    this.buttonWidth = 95,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              InkWell(
                splashColor: Colors.transparent,
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: widget.leftButtonFn,
                child: Container(
                  alignment: Alignment.center,
                  width: widget.buttonWidth,
                  height: widget.buttonHeight,
                  child: widget.leftIcon,
                ),
              ),
              _calcButton('0'),
              InkWell(
                splashColor: Colors.transparent,
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: widget.rightButtonFn,
                child: Container(
                  alignment: Alignment.center,
                  width: widget.buttonWidth,
                  height: widget.buttonHeight,
                  child: widget.rightIcon,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value) {
    return InkWell(
      splashColor: Colors.transparent,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () {
        widget.onKeyboardTap(value);
      },
      child: Container(
        alignment: Alignment.center,
        width: widget.buttonWidth,
        height: widget.buttonHeight,
        child: Text(
          value,
          style: TextStyle(
            fontSize: 45,
            color: widget.textColor,
          ),
        ),
      ),
    );
  }
}
