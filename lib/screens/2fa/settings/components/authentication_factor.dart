import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';

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
  //default case, to implement fetching of value from database
  bool isSwitched = false;

  // Explore reducing the duplicate calling of this block
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  Future<void> _authenticateUser() async {
    bool isAuthenticated = false;

    try {
      isAuthenticated = await _localAuthentication.authenticate(
        biometricOnly: true,
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return isAuthenticated;

    if (isAuthenticated) {
      print('User is authenticated!');
      // Notify backend
      setState(() {
        isSwitched = true;
      });
    } else {
      print('User is not authenticated.');
    }
  }

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
            onChanged: (value) async {
              if (value) {
                switch (widget.title) {
                  case 'Pin Code':
                    // Enable users to view State Changes before being directed to page
                    Future.delayed(Duration(milliseconds: 300), () {
                      Navigator.pushNamed(context, '/pin');
                    });
                    break;
                  case 'Biometrics':
                    await _authenticateUser();
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
