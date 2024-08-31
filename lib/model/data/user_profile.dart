import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_profile.freezed.dart';
part 'generated/user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String name,
    required int total_exercise_day_count,
    required int current_exercise_day_streak,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  static Future<UserProfile> fetch(String id) async {
    await Future.delayed(const Duration(seconds: 2));

    // サンプルデータを返す
    return UserProfile(
      id: id,
      name: 'user',
      total_exercise_day_count: 0,
      current_exercise_day_streak: 0,
    );
  }
}

extension UserProfileX on UserProfile {
  String getIconURL() => 'https://via.placeholder.com/350x350?text=sample';
}
