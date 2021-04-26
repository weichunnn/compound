import 'package:compound/constants.dart';
import 'package:compound/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenHeight(10),
            ),
            child: GNav(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                rippleColor: kPrimaryColor.withOpacity(0.5),
                gap: getProportionateScreenWidth(15),
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
                ]),
          ),
        ),
      ),
    );
  }
}
