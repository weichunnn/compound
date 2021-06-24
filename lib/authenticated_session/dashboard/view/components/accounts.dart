import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../dashboard_bloc.dart';
import '../../dashboard_state.dart';

class Accounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Text(
            'Accounts',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(16),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BlocBuilder<DashboardBloc, DashboardState>(builder: (BuildContext context, state) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(10),
              horizontal: getProportionateScreenWidth(5),
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.accounts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: getProportionateScreenWidth(15),
              mainAxisSpacing: getProportionateScreenWidth(20),
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return AccountsCard(
                icon: state.accounts[index]['icon'],
                title: state.accounts[index]['title'],
                amount: state.accounts[index]['amount'],
              );
            },
          );
        }),
      ],
    );
  }
}

class AccountsCard extends StatelessWidget {
  const AccountsCard({
    Key key,
    this.icon,
    this.title,
    this.amount,
  }) : super(key: key);

  final String icon;
  final String title;
  final int amount;

  static NumberFormat numberFormat = NumberFormat('#,###', 'en_US');

  @override
  Widget build(BuildContext context) {
    String formattedAmount = amount < 0
        ? '- \$ ' + numberFormat.format(amount * -1).toString()
        : '\$ ' + numberFormat.format(amount).toString();

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [kBoxShadow],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            decoration: BoxDecoration(
              gradient: kPrimaryGradientColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(icon),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(14),
            ),
          ),
          Text(
            formattedAmount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenHeight(14),
              color: amount < 0 ? kErrorColor : kSuccessColor,
            ),
          ),
        ],
      ),
    );
  }
}
