import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../constants.dart';
import '../../size_config.dart';

class DetailedIE extends StatelessWidget {
  const DetailedIE({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10),
          ),
          child: Row(
            children: [
              Text(
                '\u{1F4B1}',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(35),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(30)),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Salary',
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(16),
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            Text(
                              '4 Transactions',
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(16),
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          '\$30',
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(18),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    if (false)
                      Column(
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          LinearPercentIndicator(
                            padding: EdgeInsets.zero,
                            percent: 0.5,
                            progressColor: kSecondaryColor,
                          ),
                        ],
                      )
                  ],
                ),
              )
            ],
          ),
        ),
        if (true)
          Divider(
            color: Colors.grey,
            thickness: 2.5,
            indent: 45,
            endIndent: 45,
          ),
      ],
    );
  }
}
