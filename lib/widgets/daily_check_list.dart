import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DailyCheckList extends StatefulWidget {
  final List<bool> isExercisedList;

  const DailyCheckList({super.key, required this.isExercisedList});

  @override
  _DailyCheckListState createState() => _DailyCheckListState();
}

class _DailyCheckListState extends State<DailyCheckList> {
  void _checkToday() {
    final today = DateTime.now().day;
    setState(() {
      widget.isExercisedList[today - 1] = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _checkToday();
    final currentMonth = DateTime.now().month;

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            transform: GradientRotation(45),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 54, 166, 211),
              Color.fromARGB(255, 11, 61, 153),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              '$currentMonth 月',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Expanded(
              child: GridView.builder(
                shrinkWrap: true, // 高さをコンテンツに合わせる
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: widget.isExercisedList.length,
                itemBuilder: (context, index) {
                  int day = index + 1;
                  bool isDone = widget.isExercisedList[index];

                  return _DailyCheckListCell(
                      day: day,
                      isDone: isDone,
                      isToday: day == DateTime.now().day);
                },
              ),
            ),
          ),
        ]));
  }
}

class _DailyCheckListCell extends StatelessWidget {
  final int day;
  final bool isDone;
  final bool isToday;

  const _DailyCheckListCell(
      {required this.day, required this.isDone, this.isToday = false});

  @override
  Widget build(BuildContext context) {
    const calendarTextStyle = TextStyle(fontSize: 16, color: Colors.white);
    final String check = isDone ? '✅' : '';
    final checkText = isToday
        ? Text(check)
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(delay: 1000.ms, duration: 1800.ms)
            .shake(hz: 4, curve: Curves.easeInOutCubic)
            .scale(
              begin: const Offset(1, 1),
              end: const Offset(3, 3),
              duration: 600.ms,
            )
            .then(delay: 600.ms)
            .scale(
              begin: const Offset(1, 1),
              end: const Offset(1 / 3, 1 / 3),
            )
        : Text(check);

    return GridTile(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Text('$day日', style: calendarTextStyle)),
          Flexible(child: checkText),
        ],
      ),
    );
  }
}
