import 'package:flutter/material.dart';

class DailyCheckList extends StatelessWidget {
  final List<bool> isExercisedList;

  const DailyCheckList({super.key, required this.isExercisedList});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(77, 182, 172, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Expanded(
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

              return _DailyCheckListCell(day: day, isDone: isDone);
            },
          ),
        ),
      ),
    );
  }
}

class _DailyCheckListCell extends StatelessWidget {
  final int day;
  final bool isDone;

  const _DailyCheckListCell({required this.day, required this.isDone});

  @override
  Widget build(BuildContext context) {
    const calendarTextStyle = TextStyle(fontSize: 16, color: Colors.white);

    return GridTile(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Text('$day日', style: calendarTextStyle)),
          Flexible(child: Text(isDone ? '済' : '', style: calendarTextStyle)),
        ],
      ),
    );
  }
}
