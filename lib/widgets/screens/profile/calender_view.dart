import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/utils/date_time_ext.dart';
import 'package:frontend/widgets/screens/profile/profile_viewmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          _CalenderHeader(),
          Expanded(
            child: _CalenderBody(),
          ),
        ],
      ),
    );
  }
}

class _CalenderHeader extends ConsumerWidget {
  const _CalenderHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = Supabase.instance.client.auth.currentUser!.id;
    final state = ref.watch(profileViewModelProvider(userId));
    final viewModel = ref.watch(profileViewModelProvider(userId).notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            viewModel.setSelectedDate(state.value!.selectedDate!.previousMonth);
          },
          child: const Text('< 前の月'),
        ),
        Text(
          '${state.value!.selectedDate!.year}年 ${state.value!.selectedDate!.month}月',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            viewModel.setSelectedDate(state.value!.selectedDate!.nextMonth);
          },
          child: const Text('次の月 >'),
        ),
      ],
    );
  }
}

class _CalenderBody extends StatelessWidget {
  const _CalenderBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 42),
          _buildCalendarBody(),
        ],
      ),
    );
  }

  Widget _buildCalendarHeader() {
    List<String> weekdays = ['日', '月', '火', '水', '木', '金', '土'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: weekdays
          .map(
            (day) => Expanded(
              child: Center(
                child: Row(
                  children: [
                    Text(
                      day,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCalendarBody() {
    List<int> daysInMonth = List.generate(31, (index) => index + 1);
    List<int> completedDays = [2, 3, 4, 5, 6];

    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7, // 一週間の曜日の数
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: daysInMonth.length,
        itemBuilder: (context, index) {
          int day = daysInMonth[index];
          bool isCompleted = completedDays.contains(day);

          return Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? Colors.red : Colors.transparent,
                border: Border.all(color: Colors.red, width: 2),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  isCompleted ? '済' : day.toString(),
                  style: TextStyle(
                    color: isCompleted ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
