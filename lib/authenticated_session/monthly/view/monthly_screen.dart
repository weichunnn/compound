import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../size_config.dart';
import '../../../components/base_card.dart';
import 'budget_card.dart';
import 'month_overview_card.dart';
import '../../../authenticated_session/monthly/monthly_bloc.dart';
import '../../../authenticated_session/monthly/monthly_state.dart';
import '../../../authenticated_session/monthly/view/upcoming_payments_card.dart';

class MonthlyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -60,
          left: -250,
          child: Container(
            width: getProportionateScreenHeight(550),
            height: getProportionateScreenHeight(550),
            decoration: BoxDecoration(
              color: Color(0xFFF26C74),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -175,
          right: -225,
          child: Container(
            width: getProportionateScreenHeight(400),
            height: getProportionateScreenHeight(400),
            decoration: BoxDecoration(
              color: Color(0xFFDFFF1A),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent, // remove default background color
          appBar: AppBar(
            title: Text(
              'Monthly Overview',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: BlocProvider(
            create: (BuildContext context) => MonthlyBloc(),
            child: SingleChildScrollView(
              child: SafeArea(
                minimum: EdgeInsets.symmetric(horizontal: 20),
                child: BlocBuilder<MonthlyBloc, MonthlyState>(
                  builder: (BuildContext context, state) {
                    return Column(
                      children: [
                        BaseCard(
                          height: getProportionateScreenHeight(250),
                          body: MonthOverview(),
                        ),
                        BaseCard(
                          body: UpcomingPaymentsCard(state: state),
                        ),
                        BaseCard(
                          body: BudgetCard(state: state),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
