import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/link_text.dart';
import '../../../authenticated_session/authenticated_session_navigation/authenticated_session_cubit.dart';

class MonthOverview extends StatelessWidget {
  const MonthOverview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              'August',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(16),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<AuthenticatedSessionCubit>().showIncomeExpenditure(isIncome: true);
                  },
                  child: IEOverview(
                    title: 'Income',
                    amount: '\$5,000',
                    color: kSuccessColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<AuthenticatedSessionCubit>().showIncomeExpenditure(isIncome: false);
                  },
                  child: IEOverview(
                    title: 'Expenditure',
                    amount: '\$2,000',
                    color: kErrorColor,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: kTextColor,
            thickness: 1,
            endIndent: 20,
          ),
          Spacer(),
          Text(
            'Here are some insights that we gathered about your financials.',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(14),
              color: Colors.black,
            ),
          ),
          Spacer(flex: 3),
          Align(
            alignment: Alignment.centerLeft,
            child: LinkText(
              text: 'Tell me more',
              onTap: () {},
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class IEOverview extends StatelessWidget {
  const IEOverview({
    Key key,
    this.title,
    this.amount,
    this.color,
  }) : super(key: key);

  final String title;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 12.5,
          width: 12.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(16),
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
              child: Text(
                amount,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
