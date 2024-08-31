import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/model/data/user_profile.dart';
import 'package:frontend/widgets/edit_profile_page.dart';
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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: userProfile.when(
          data: (profile) {
            final iconURL = profile.getIconURL();

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(iconURL),
                  ),
                  const SizedBox(height: 20), // 名前とアイコンの間にスペースを追加
                  Text(
                    profile.name,
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20), // 名前と情報の間にスペースを追加
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '累計：${profile.total_exercise_day_count} 日',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        '連続：${profile.current_exercise_day_streak} 日',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }
}
