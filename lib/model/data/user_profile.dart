import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    final supabase = Supabase.instance.client;

    final response = await supabase.functions.invoke(
      'profile/$id', // パスパラメータとしてuserIdを埋め込む
      method: HttpMethod.get,
    );

    print(response.data["user_profile"]);

    return UserProfile.fromJson(
        response.data["user_profile"] as Map<String, dynamic>);
  }
}

extension UserProfileX on UserProfile {
  String getIconURL() => 'https://via.placeholder.com/350x350?text=sample';
}
