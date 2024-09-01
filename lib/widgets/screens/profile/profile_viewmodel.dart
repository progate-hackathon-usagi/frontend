import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gathercise/model/data/exercise_logs_response.dart';
import 'package:gathercise/model/data/user_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/profile_viewmodel.freezed.dart';

final profileViewModelProvider = StateNotifierProvider.family<ProfileViewModel,
    AsyncValue<ProfileState>, String>(
  (ref, userId) => ProfileViewModel(userId),
);

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserProfile? userProfile,
    ExerciseLogsResponse? exerciseLogs,
    DateTime selectedDate,
  }) = _ProfileState;
}

class ProfileViewModel extends StateNotifier<AsyncValue<ProfileState>> {
  late final String _userId;

  ProfileViewModel(String userId) : super(const AsyncValue.loading()) {
    _userId = userId;
    _fetchData(DateTime.now());
  }

  Future<void> _fetchData(DateTime dateTime) async {
    try {
      final userProfile = await UserProfile.fetch(_userId);
      final exerciseLogs = await _fetchExerciseLogs(dateTime);
      state = AsyncValue.data(ProfileState(
        userProfile: userProfile,
        exerciseLogs: exerciseLogs,
        selectedDate: dateTime,
      ));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<ExerciseLogsResponse> _fetchExerciseLogs(DateTime? dateTime) async {
    return ExerciseLogsResponse.fetch(_userId, dateTime);
  }

  void setSelectedDate(DateTime dateTime) {
    _fetchData(dateTime);
  }
}
