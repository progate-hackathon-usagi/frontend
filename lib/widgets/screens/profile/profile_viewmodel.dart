import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/model/data/user_profile.dart';

final profileViewModelProvider = StateNotifierProvider.family<ProfileViewModel,
    AsyncValue<UserProfile>, String>(
  (ref, userId) => ProfileViewModel(userId),
);

class ProfileViewModel extends StateNotifier<AsyncValue<UserProfile>> {
  ProfileViewModel(String userId) : super(const AsyncValue.loading()) {
    _userId = userId;
    _fetchUserProfile();
  }

  late final String _userId;

  Future<void> _fetchUserProfile() async {
    try {
      final profile = await UserProfile.fetch(_userId);
      state = AsyncValue.data(profile);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.empty);
    }
  }
}
