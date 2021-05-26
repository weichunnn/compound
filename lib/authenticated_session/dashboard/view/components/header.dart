import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

import '../../../../size_config.dart';
import '../../dashboard_bloc.dart';
import '../../dashboard_state.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EasyRichText(
              '\$ 2,705',
              defaultStyle: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenHeight(25),
                fontWeight: FontWeight.bold,
              ),
              patternList: [
                EasyRichTextPattern(
                  targetString: '2,705',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(40),
                  ),
                ),
              ],
            ),
            Text(
              'Available Cash Balance',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(14),
                color: Colors.white,
              ),
            )
          ],
        ),
        BlocBuilder<DashboardBloc, DashboardState>(
          builder: (BuildContext context, state) {
            final counter = state.counter;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
              ),
              child: counter == 0
                  ? Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: getProportionateScreenHeight(30),
                    )
                  : Badge(
                      toAnimate: false,
                      padding: EdgeInsets.all(counter < 10 ? 7.5 : 5),
                      position: BadgePosition.topEnd(end: -5),
                      badgeContent: Text(
                        counter.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: getProportionateScreenHeight(30),
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}
