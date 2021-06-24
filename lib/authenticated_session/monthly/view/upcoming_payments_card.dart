import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../monthly_state.dart';

class UpcomingPaymentsCard extends StatelessWidget {
  const UpcomingPaymentsCard({
    Key key,
    this.state,
  }) : super(key: key);

  final MonthlyState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              'Upcoming Payments',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(16),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          state.upcomingPayments.length == 0
              ? Container(
                  height: getProportionateScreenHeight(150),
                  child: Center(
                    child: Text(
                      'You have no \n Upcoming Payment due',
                      style: TextStyle(fontSize: getProportionateScreenHeight(16)),
                      textAlign: TextAlign.center,
                    ),
                  ))
              : Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    padding: EdgeInsets.all(15),
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.75, // Set by width divide height
                    children: List.generate(
                          state.upcomingPayments.length < 3 ? state.upcomingPayments.length : 3,
                          (index) => UpcomingPaymentBox(
                            title: state.upcomingPayments[index]['title'],
                            time: state.upcomingPayments[index]['time'],
                            color: state.colors[index],
                            onTap: () => print('HAHAHHAA'),
                          ),
                        ) +
                        [
                          UpcomingPaymentBox(
                            title: 'View More',
                            time: '',
                            color: state.colors[3],
                            onTap: () {},
                          ),
                        ],
                  ),
                ),
        ],
      ),
    );
  }
}

class UpcomingPaymentBox extends StatelessWidget {
  const UpcomingPaymentBox({
    Key key,
    this.color,
    this.title,
    this.time,
    this.onTap,
  }) : super(key: key);

  final Color color;
  final String title;
  final String time;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10), // For splash
      splashColor: color,
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: getProportionateScreenHeight(14),
                fontWeight: FontWeight.bold,
                color: title == 'View More' ? Colors.white : kTextColor,
              ),
            ),
            title == 'View More'
                ? Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.arrow_forward,
                        size: getProportionateScreenHeight(30),
                        color: Colors.white,
                      ),
                    ),
                  )
                : Text(
                    time,
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(12),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
