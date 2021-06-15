import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../../components/colored_icon.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key key,
    this.newUpdate = false,
    this.text,
    this.timeStamp,
  }) : super(key: key);

  final bool newUpdate;
  final String text;
  final String timeStamp;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: newUpdate ? kPrimaryColor.withOpacity(0.25) : Colors.white,
      ),
      margin: EdgeInsets.only(
        bottom: getProportionateScreenHeight(10),
      ),
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
        horizontal: getProportionateScreenWidth(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ColoredIcon(
            icon: Icons.image,
            backgroundColor: Colors.pink,
            color: Colors.white,
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(14),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  timeStamp,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(14),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
