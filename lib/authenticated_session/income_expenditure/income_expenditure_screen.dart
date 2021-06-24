import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'detailed_IE.dart';
import 'income_expenditure_doughnut.dart';
import '../../constants.dart';
import '../../size_config.dart';
import '../../authenticated_session/authenticated_session_navigation/authenticated_session_cubit.dart';
import '../../authenticated_session/income_expenditure/income_expenditure_bloc.dart';
import '../../authenticated_session/income_expenditure/income_expenditure_event.dart';
import '../../authenticated_session/income_expenditure/income_expenditure_state.dart';
import '../../components/multi_select_chips.dart';

class IncomeExpenditureScreen extends StatelessWidget {
  const IncomeExpenditureScreen({
    Key key,
    this.isIncome,
  }) : super(key: key);

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    final List detailedIncomeOptions = ['Categories', 'Transactions', 'Merchants'];
    return Scaffold(
      appBar: AppBar(
        title: Text(isIncome ? 'Income' : 'Expenditure'),
        leadingWidth: 75,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            context.read<AuthenticatedSessionCubit>().showMonthly();
          },
        ),
      ),
      body: BlocProvider<IncomeExpenditureBloc>(
        create: (BuildContext context) => IncomeExpenditureBloc(),
        child: Stack(
          children: [
            BlocBuilder<IncomeExpenditureBloc, IncomeExpenditureState>(
              builder: (BuildContext context, state) {
                return Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: MultiSelectChip(
                        choicesList: state.timeOptionsSelection,
                        selectedChoices: state.timeOptionSelected,
                        textSize: getProportionateScreenHeight(12),
                        onSelected: (selected) {
                          context.read<IncomeExpenditureBloc>().add(TimeOptionSelected(
                                selectedText: selected,
                              ));
                        },
                      ),
                    ),
                    IncomeExpenditureDoughnut(),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
            BlocBuilder<IncomeExpenditureBloc, IncomeExpenditureState>(builder: (BuildContext context, state) {
              return DraggableScrollableSheet(
                initialChildSize: 0.40,
                minChildSize: 0.40,
                maxChildSize: 1.0,
                builder: (BuildContext context, scrollController) {
                  return Container(
                    padding: EdgeInsets.all(getProportionateScreenHeight(25)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, -5),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.5),
                          child: Container(
                            height: 5,
                            width: 75,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            controller: scrollController,
                            children: [
                              SizedBox(height: getProportionateScreenHeight(10)),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      isIncome ? 'Detailed Income' : 'Detailed Expenditure',
                                      style: TextStyle(
                                        fontSize: getProportionateScreenHeight(16),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: getProportionateScreenHeight(25),
                                        vertical: getProportionateScreenHeight(15),
                                      ),
                                      backgroundColor: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (_) {
                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: getProportionateScreenWidth(25),
                                                vertical: getProportionateScreenHeight(15),
                                              ),
                                              width: getProportionateScreenWidth(150),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: detailedIncomeOptions
                                                    .map((option) => DetailedOption(
                                                          text: option,
                                                          selected: state.detailedOptionSelected == option,
                                                          onPressed: () {
                                                            context
                                                                .read<IncomeExpenditureBloc>()
                                                                .add(DetailedOptionSelected(selectedText: option));
                                                          },
                                                        ))
                                                    .toList(),
                                              ),
                                            );
                                          });
                                    },
                                    child: Text(
                                      state.detailedOptionSelected,
                                      style: TextStyle(
                                        fontSize: getProportionateScreenHeight(14),
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: List.generate(
                                  5,
                                  (index) => DetailedIE(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class DetailedOption extends StatelessWidget {
  const DetailedOption({
    Key key,
    this.text,
    this.selected = false,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final bool selected;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(5),
      ),
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(25),
            vertical: getProportionateScreenHeight(15),
          ),
          backgroundColor: selected ? kPrimaryColor.withOpacity(0.75) : kOptionsColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          onPressed();
          Navigator.of(context).pop(); // Close bottom sheet
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenHeight(14),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
