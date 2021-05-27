import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../constants.dart';
import '../size_config.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      padding: EdgeInsets.all(
        getProportionateScreenHeight(15),
      ),
      child: GNav(
        padding: EdgeInsets.all(getProportionateScreenHeight(12.5)),
        rippleColor: kPrimaryColor.withOpacity(0.5),
        gap: getProportionateScreenWidth(10),
        activeColor: kPrimaryColor,
        iconSize: getProportionateScreenWidth(25),
        tabBackgroundColor: kPrimaryColor.withOpacity(0.20),
        color: Colors.black,
        curve: Curves.easeInOut,
        tabBorderRadius: 50,
        tabs: [
          GButton(
            icon: LineIcons.home,
            text: 'Home',
          ),
          GButton(
            icon: LineIcons.pieChart,
            text: 'Monthly',
          ),
          GButton(
            icon: LineIcons.layerGroup,
            text: 'Discover',
          ),
          GButton(
            icon: LineIcons.cog,
            text: 'Settings',
          )
        ],
      ),
    );
  }
}
