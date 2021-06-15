import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../app_navigation/session_cubit.dart';
import '../dashboard_bloc.dart';

import 'components/overview.dart';
import '../../../authenticated_session/dashboard/view/components/header.dart';
import '../../../authenticated_session/dashboard/view/components/transaction.dart';
import '../../../authenticated_session/dashboard/view/components/accounts.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialization for Sizing Configs
    SizeConfig().init(context);
    return BlocProvider<DashboardBloc>(
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
                Header(),
                SizedBox(height: getProportionateScreenHeight(20)),
                Overview(),
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
    );
  }
}
