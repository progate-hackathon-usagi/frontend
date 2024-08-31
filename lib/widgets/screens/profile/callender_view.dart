import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/utils/date_time_ext.dart';
import 'package:frontend/widgets/screens/profile/profile_viewmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CallenderView extends StatelessWidget {
  const CallenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          _CallenderHeader(),
        ],
      ),
    );
  }
}

class _CallenderHeader extends ConsumerWidget {
  const _CallenderHeader();

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
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
