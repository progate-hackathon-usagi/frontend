import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/model/data/user_profile.dart';
import 'package:frontend/widgets/edit_profile_page.dart';
import 'package:frontend/widgets/screens/profile/calendar_view.dart';
import 'package:frontend/widgets/screens/profile/profile_viewmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = Supabase.instance.client.auth.currentUser!.id;
    final userProfile = ref.watch(profileViewModelProvider(userId));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(),
                  ),
                );
                if (result == true) {
                  ref.refresh(profileViewModelProvider(userId));
                }
              },
            ),
          ],
        ),
        body: Column(children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                transform: const GradientRotation(45),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.withOpacity(0.4), // Sky blue
                  const Color.fromARGB(255, 37, 33, 243)
                      .withOpacity(0.4), // Steel blue
                ],
              ),
            ),
            child: Center(
              child: userProfile.when(
                data: (state) => _ProfileContent(profile: state.userProfile!),
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => ErrorText(error: error),
              ),
            ),
          ),
        ]));
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent({required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(42, 32, 0, 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProfileAvatar(iconUrl: profile.getIconURL()),
              const SizedBox(width: 32),
              _ProfileDetails(profile: profile),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              const CalendarView(),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.iconUrl});

  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(iconUrl),
      radius: 50,
    );
  }
}

class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails({required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          profile.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        _StreakText(streak: profile.current_exercise_day_streak),
        const SizedBox(height: 4.0),
        _ProfileDivider(),
        const SizedBox(height: 8.0),
        Text(
          '累計 ${profile.total_exercise_day_count.toString()}日 体操をしています',
          style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
        ),
      ],
    );
  }
}

class _StreakText extends StatelessWidget {
  const _StreakText({required this.streak});

  final int streak;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "$streak",
          style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8.0),
        const Text(
          "日継続中🔥",
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}

class _ProfileDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      width: MediaQuery.of(context).size.width - 42 - 32 - 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 1.0,
        ),
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Text('Error: $error');
  }
}
