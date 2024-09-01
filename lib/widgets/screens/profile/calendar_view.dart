import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/utils/date_time_ext.dart';
import 'package:frontend/widgets/screens/profile/profile_viewmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:frontend/model/data/exercise_logs_response.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          _CalendarHeader(),
          Expanded(
            child: _CalendarBody(),
          ),
        ],
      ),
    );
  }
}

class _CalendarHeader extends ConsumerWidget {
  const _CalendarHeader();

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

class _CalendarBody extends ConsumerWidget {
  const _CalendarBody();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = Supabase.instance.client.auth.currentUser!.id;
    final state = ref.watch(profileViewModelProvider(userId));
    final selectedDate = state.value!.selectedDate!;
    final daysInMonth = List.generate(
      DateTime(selectedDate.year, selectedDate.month + 1, 0).day,
      (index) => index + 1,
    );

    return FutureBuilder<ExerciseLogsResponse>(
      future: ExerciseLogsResponse.fetch(userId, selectedDate),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2.0),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final completedDays = snapshot.data!.exercise_logs_for_month
            .map((log) => log.timestamp.day)
            .toSet()
            .toList();

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 42),
              _buildCalendarBody(daysInMonth, completedDays),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCalendarBody(List<int> daysInMonth, List<int> completedDays) {
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
