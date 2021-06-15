import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../constants.dart';
import '../size_config.dart';
import 'package:compound/authenticated_session/authenticated_session_navigation/authenticated_session_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

enum _SelectedTab { dashboard, monthly, discover, settings }

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedTab = _SelectedTab.dashboard;

  void _handleIndexChanged(int i) {
    var currentState = _SelectedTab.values[i];

    setState(() {
      _selectedTab = currentState;
    });

    switch (currentState) {
      case _SelectedTab.dashboard:
        context.read<AuthenticatedSessionCubit>().showDashboard();
        break;
      case _SelectedTab.monthly:
        context.read<AuthenticatedSessionCubit>().showMonthly();
        break;
      case _SelectedTab.discover:
        break;
      case _SelectedTab.settings:
        break;
    }
  }

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
        selectedIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTabChange: _handleIndexChanged,
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
