import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/daily_check_list.dart';

class ExerciseCard extends StatelessWidget {
  final int year;
  final int month;
  final List<bool> isExercisedList;

  const ExerciseCard(
      {super.key,
      required this.year,
      required this.month,
      required this.isExercisedList});

  @override
  Widget build(BuildContext context) {
    const headingTextStyle = TextStyle(fontSize: 36, color: Colors.white);

    return SizedBox(
      width: 450,
      height: 600,
      child: Card(
        color: Colors.teal[200],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            color: Colors.teal[400],
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('$year年 $month月', style: headingTextStyle),
                  const SizedBox(height: 20),
                  DailyCheckList(isExercisedList: isExercisedList)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: "ExerciseCard",
  type: ExerciseCard,
)
ExerciseCard exerciseCard(BuildContext context) {
  const year = 2024;
  const month = 8;
  final isExercisedList = List.generate(31, (index) => Random().nextBool());
  return ExerciseCard(
    year: year,
    month: month,
    isExercisedList: isExercisedList,
  );
}
