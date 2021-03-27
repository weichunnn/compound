import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class AuthenticationFactor extends StatefulWidget {
  const AuthenticationFactor({
    Key key,
    this.image,
    this.title,
    this.caption,
  }) : super(key: key);

  final String image;
  final String title;
  final String caption;

  @override
  _AuthenticationFactorState createState() => _AuthenticationFactorState();
}

class _AuthenticationFactorState extends State<AuthenticationFactor> {
  //default case
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                widget.image,
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenHeight(50),
                alignment: Alignment.center,
              ),
              SizedBox(
                width: getProportionateScreenWidth(25),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.caption,
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(14),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
              if (value) {
                switch (widget.title) {
                  case 'Pin Code':
                    // Enable users to view State Changes before being directed to page
                    Future.delayed(Duration(milliseconds: 300), () {
                      Navigator.pushNamed(context, '/pin');
                    });
                    break;
                  case 'Biometrics':
                    print('Bio Enable');
                    break;
                }
              }
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: kSuccessColor,
            inactiveTrackColor: Colors.redAccent.shade100,
            inactiveThumbColor: kErrorColor,
          ),
        ],
      ),
    );
  }
}
