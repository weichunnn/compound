import 'package:compound/authenticated_session/dashboard/view/components/transaction.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../app_navigation/session_cubit.dart';
import '../../../components/bottom_nav_bar.dart';
import '../dashboard_bloc.dart';
import '../../../authenticated_session/dashboard/dashboard_event.dart';
import '../../../authenticated_session/dashboard/dashboard_state.dart';
import '../../../authenticated_session/dashboard/view/components/overview_chart.dart';
import '../../../components/card_options.dart';
import '../../../authenticated_session/dashboard/view/components/accounts.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialization for Sizing Configs
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: BlocProvider<DashboardBloc>(
        create: (context) => DashboardBloc(),
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.down,
          child: Stack(children: [
            Container(
              height: getProportionateScreenHeight(275),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    kPrimaryColor,
                    kSecondaryColor,
                  ],
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(SizeConfig.screenWidth, getProportionateScreenHeight(50)),
                ),
              ),
            ),
            SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Row(
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
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(
                        getProportionateScreenHeight(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: getProportionateScreenWidth(15)),
                                  child: Text(
                                    'Overview',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenHeight(16),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
                                    return Wrap(
                                      alignment: WrapAlignment.spaceBetween,
                                      children: List.generate(
                                        state.overviewTypeSelection.length,
                                        (index) {
                                          return CardOptions(
                                            text: state.overviewTypeSelection[index],
                                            selected: state.overviewTypeSelected,
                                            onPressed: () {
                                              context.read<DashboardBloc>().add(
                                                    OverviewTypeSelected(
                                                      selectedText: state.overviewTypeSelection[index],
                                                    ),
                                                  );
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: getProportionateScreenHeight(200),
                            child: OverviewChart(),
                          ),
                          Container(
                            width: double.infinity,
                            child: BlocBuilder<DashboardBloc, DashboardState>(
                              builder: (BuildContext context, state) {
                                return Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  children: List.generate(
                                    state.overviewTimeSelection.length,
                                    (index) {
                                      return CardOptions(
                                        text: state.overviewTimeSelection[index],
                                        selected: state.overviewTimeSelected,
                                        onPressed: () {
                                          context.read<DashboardBloc>().add(
                                                OverviewTimeSelected(
                                                  selectedText: state.overviewTimeSelection[index],
                                                ),
                                              );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Accounts(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Transaction(),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Text(
                    'Welcome View',
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(16),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      BlocProvider.of<SessionCubit>(context).signOut();
                    },
                    icon: Icon(Icons.logout),
                    label: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
