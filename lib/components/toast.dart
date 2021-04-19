import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

Future toast({context, text, backgroundColor, textColor, iconColor}) {
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
        backgroundColor: backgroundColor,
        boxShadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5.0,
            spreadRadius: 0,
            offset: Offset(5, 5),
          ),
        ],
        barrierDismissible: false,
        enableDrag: true,
        horizontalDismissDirection: HorizontalDismissDirection.horizontal,
        alignment: Alignment.topCenter,
        child: FlashBar(
          message: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: getProportionateScreenHeight(14),
            ),
          ),
          icon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20),
            ),
            child: Icon(
              Icons.info,
              color: iconColor,
              size: getProportionateScreenHeight(25),
            ),
          ),
        ),
      );
    },
  );
}
