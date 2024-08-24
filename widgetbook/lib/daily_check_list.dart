import 'package:flutter/material.dart';

class DailyCheckList extends StatelessWidget {
  final List<bool> isExercisedList;

  const DailyCheckList({super.key, required this.isExercisedList});

  @override
  Widget build(BuildContext context) {
    const calendarTextStyle = TextStyle(fontSize: 16, color: Colors.white);
    return Card(
      color: const Color.fromRGBO(77, 182, 172, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: GridView.builder(
          shrinkWrap: true, // 高さをコンテンツに合わせる
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemCount: isExercisedList.length,
          itemBuilder: (context, index) {
            int day = index + 1;
            bool isDone = isExercisedList[index];

            return GridTile(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$day日', style: calendarTextStyle),
                  Text(isDone ? '済' : '', style: calendarTextStyle),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
