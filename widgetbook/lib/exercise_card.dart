import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class ExerciseCard extends StatelessWidget {
  final int year;
  final int month;

  const ExerciseCard({super.key, required this.year, required this.month});

  @override
  Widget build(BuildContext context) {
    int daysInMonth = DateTime(year, month + 1, 0).day;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$year年 $month月', style: const TextStyle(fontSize: 20)),
            GridView.builder(
              shrinkWrap: true, // 高さをコンテンツに合わせる
              physics: const NeverScrollableScrollPhysics(), // スクロール無効
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: daysInMonth,
              itemBuilder: (context, index) {
                DateTime date = DateTime(year, month, index + 1);
                bool isDone = false;
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
  return const ExerciseCard(year: 2024, month: 8);
}
