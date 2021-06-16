import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

import '../../../../size_config.dart';
import '../../dashboard_bloc.dart';
import '../../dashboard_state.dart';
import '../../../authenticated_session_navigation/authenticated_session_cubit.dart';

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
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
              ),
              child: IconButton(
                icon: state.counter == 0
                    ? Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: getProportionateScreenHeight(30),
                      )
                    : Stack(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: getProportionateScreenHeight(30),
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              // Text child can be inserted and badge will expand as text size increases
                              constraints: BoxConstraints(
                                minWidth: getProportionateScreenHeight(15),
                                minHeight: getProportionateScreenHeight(15),
                              ),
                            ),
                          )
                        ],
                      ),
                onPressed: () {
                  context.read<AuthenticatedSessionCubit>().showNotifications();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
