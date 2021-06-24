import 'package:flutter/material.dart';

import '../constants.dart';

class MultiSelectChip extends StatelessWidget {
  const MultiSelectChip({
    Key key,
    this.selectedChoices,
    this.choicesList,
    this.onSelected,
    this.textSize,
    this.padding = const EdgeInsets.symmetric(horizontal: 7.5),
  }) : super(key: key);

  final List<String> choicesList;
  final List<String> selectedChoices;
  final Function onSelected;
  final double textSize;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: choicesList.map(
        (item) {
          return Container(
            padding: padding,
            child: ChoiceChip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
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
