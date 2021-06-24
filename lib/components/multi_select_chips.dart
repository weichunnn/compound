import 'package:flutter/material.dart';

import '../constants.dart';

class MultiSelectChip extends StatelessWidget {
  const MultiSelectChip({
    Key key,
    this.selectedChoices,
    this.choicesList,
    this.onSelected,
    this.textSize,
  }) : super(key: key);

  final List<String> choicesList;
  final List<String> selectedChoices;
  final Function onSelected;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: choicesList.map(
        (item) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: ChoiceChip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              label: Text(item),
              labelStyle: TextStyle(
                fontWeight: selectedChoices.contains(item) ? FontWeight.bold : null,
                color: selectedChoices.contains(item) ? Colors.white : kTextColor,
                fontSize: textSize,
              ),
              selected: selectedChoices.contains(item),
              onSelected: (_) {
                onSelected(item);
              },
              backgroundColor: kOptionsColor,
              selectedColor: kPrimaryColor,
            ),
          );
        },
      ).toList(),
    );
  }
}
