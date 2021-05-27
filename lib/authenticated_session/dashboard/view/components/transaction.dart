import 'package:compound/authenticated_session/dashboard/dashboard_bloc.dart';
import 'package:compound/authenticated_session/dashboard/dashboard_state.dart';
import 'package:compound/components/link_text.dart';
import 'package:compound/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../size_config.dart';

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
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(
              getProportionateScreenHeight(10),
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
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(12),
        horizontal: getProportionateScreenWidth(5),
      ),
      height: getProportionateScreenHeight(75),
      child: Row(
        children: [
          Container(
            height: getProportionateScreenHeight(42),
            width: getProportionateScreenWidth(42),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green,
            ),
            child: Icon(Icons.ac_unit),
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Container(
                  width: getProportionateScreenWidth(85),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
