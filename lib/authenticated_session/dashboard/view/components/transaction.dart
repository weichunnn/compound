import 'package:compound/components/colored_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../size_config.dart';
import '../../../../components/base_card.dart';
import '../../../../authenticated_session/dashboard/dashboard_bloc.dart';
import '../../../../authenticated_session/dashboard/dashboard_state.dart';
import '../../../../components/link_text.dart';
import '../../../../constants.dart';

class Transaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              LinkText(
                text: 'See All',
                fontSize: 14,
                onTap: () {},
              ),
            ],
          ),
        ),
        BaseCard(
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
            ),
            child: BlocBuilder<DashboardBloc, DashboardState>(builder: (BuildContext context, state) {
              return Column(
                children: List.generate(
                  5,
                  (index) {
                    return TransactionCard(
                      category: state.transactions[index]['category'],
                      merchant: state.transactions[index]['merchant'],
                      amount: state.transactions[index]['amount'],
                      date: state.transactions[index]['date'],
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key key,
    this.category,
    this.merchant,
    this.amount,
    this.date,
  }) : super(key: key);

  static NumberFormat numberFormat = NumberFormat('#,###', 'en_US');
  final String category;
  final String merchant;
  final int amount;
  final String date;

  @override
  Widget build(BuildContext context) {
    String formattedAmount = amount < 0
        ? '- \$ ' + numberFormat.format(amount * -1).toString()
        : '\$ ' + numberFormat.format(amount).toString();

    return Container(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: Row(
        children: [
          ColoredIcon(
            backgroundColor: Colors.cyan,
            icon: Icons.access_alarm_sharp,
            color: Colors.white,
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(14),
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        merchant,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(14),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      formattedAmount,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(14),
                        color: amount < 0 ? kErrorColor : kSuccessColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(14),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
