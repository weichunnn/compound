import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../size_config.dart';
import '../../dashboard_bloc.dart';
import '../../dashboard_event.dart';
import '../../dashboard_state.dart';
import '../../../../components/card_options.dart';
import 'overview_chart.dart';
import '../../../../components/base_card.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseCard(
      body: Column(
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
    );
  }
}
