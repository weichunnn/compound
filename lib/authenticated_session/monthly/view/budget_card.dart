import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../monthly_state.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({
    Key key,
    this.state,
  }) : super(key: key);

  final MonthlyState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
      child: Column(children: [
        Container(
          width: double.infinity,
          child: Text(
            'Budget',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(16),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        state.budgets.length == 0
            ? Container(
                height: getProportionateScreenHeight(100),
                child: Center(
                  child: Text(
                    'Start tracking your budget here',
                    style: TextStyle(fontSize: getProportionateScreenHeight(16)),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : Column(children: [
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet_rounded,
                          color: kPrimaryColor,
                        ),
                        SizedBox(width: getProportionateScreenWidth(10)),
                        Text(
                          'Balance Available',
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(14),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '\$1,100',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(20),
                      ),
                    )
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                        state.budgets.length < 4 ? state.upcomingPayments.length : 4,
                        (index) => Container(
                          child: CircularPercentIndicator(
                            animation: true,
                            radius: getProportionateScreenHeight(40),
                            lineWidth: 2.5,
                            percent: state.budgets[index]['percentage'],
                            center: Icon(Icons.ac_unit),
                            progressColor: state.budgets[index]['percentage'] < 1 ? kSecondaryColor : kErrorColor,
                          ),
                        ),
                      ) +
                      [
                        Container(
                          height: getProportionateScreenHeight(40),
                          width: getProportionateScreenHeight(40),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(getProportionateScreenHeight(20)),
                            splashColor: kPrimaryColor.withOpacity(0.20),
                            highlightColor: Colors.transparent, // remove default gray overlay from ink well
                            onTap: () {},
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [kBoxShadow],
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                size: 25,
                                color: kSecondaryColor,
                              ),
                            ),
                          ),
                        )
                      ],
                ),
              ]),
      ]),
    );
  }
}
