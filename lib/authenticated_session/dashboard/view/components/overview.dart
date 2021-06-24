import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../size_config.dart';
import '../../dashboard_bloc.dart';
import '../../dashboard_event.dart';
import '../../dashboard_state.dart';
import 'overview_chart.dart';
import '../../../../components/base_card.dart';
import '../../../../components/multi_select_chips.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseCard(
      body: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(10)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                'Overview',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
              return MultiSelectChip(
                choicesList: state.overviewTypeSelection,
                selectedChoices: state.overviewTypeSelected,
                textSize: getProportionateScreenHeight(10),
                onSelected: (selected) {
                  context.read<DashboardBloc>().add(
                        OverviewTypeSelected(
                          selectedText: selected,
                        ),
                      );
                },
              );
            }),
            Container(
              height: getProportionateScreenHeight(200),
              child: OverviewChart(),
            ),
            BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
              return MultiSelectChip(
                choicesList: state.overviewTimeSelection,
                selectedChoices: state.overviewTimeSelected,
                textSize: getProportionateScreenHeight(10),
                padding: EdgeInsets.symmetric(horizontal: 5),
                onSelected: (selected) {
                  context.read<DashboardBloc>().add(
                        OverviewTimeSelected(
                          selectedText: selected,
                        ),
                      );
                },
              );
            }),
            // Container(
            //   width: double.infinity,
            //   child: BlocBuilder<DashboardBloc, DashboardState>(
            //     builder: (BuildContext context, state) {
            //       return Wrap(
            //         alignment: WrapAlignment.spaceBetween,
            //         children: List.generate(
            //           state.overviewTimeSelection.length,
            //           (index) {
            //             return CardOptions(
            //               text: state.overviewTimeSelection[index],
            //               selected: state.overviewTimeSelected,
            //               onPressed: () {
            //                 context.read<DashboardBloc>().add(
            //                       OverviewTimeSelected(
            //                         selectedText: state.overviewTimeSelection[index],
            //                       ),
            //                     );
            //               },
            //             );
            //           },
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
