import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

Future toast({context, text}) {
  return showFlash(
    context: context,
    duration: Duration(seconds: 3),
    builder: (context, controller) {
      return Flash.dialog(
        controller: controller,
        margin: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(15),
          horizontal: getProportionateScreenWidth(25),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        backgroundColor: kErrorColor,
        boxShadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.5,
            blurRadius: 7.5,
            offset: Offset(0, 5),
          ),
        ],
        enableDrag: true,
        horizontalDismissDirection: HorizontalDismissDirection.horizontal,
        alignment: Alignment.topCenter,
        child: FlashBar(
          message: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenHeight(16),
            ),
          ),
          icon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20),
            ),
            child: Icon(
              Icons.info,
              color: Colors.white,
              size: getProportionateScreenHeight(30),
            ),
          ),
        ),
      );
    },
  );
}
