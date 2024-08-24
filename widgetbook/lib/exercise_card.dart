import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$year年 $month月', style: const TextStyle(fontSize: 36)),
            GridView.builder(
              shrinkWrap: true, // 高さをコンテンツに合わせる
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: isExercisedList.length,
              itemBuilder: (context, index) {
                DateTime date = DateTime(year, month, index + 1);
                bool isDone = isExercisedList[index];

                return GridTile(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${date.day}日'),
                      Text(isDone ? '済' : ''),
                    ],
                  ),
                );
              },
            ),
          ],
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
