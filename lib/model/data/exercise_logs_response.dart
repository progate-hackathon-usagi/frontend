import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'generated/exercise_logs_response.freezed.dart';
part 'generated/exercise_logs_response.g.dart';

@freezed
class ExerciseLogsResponse with _$ExerciseLogsResponse {
  const factory ExerciseLogsResponse({
    required List<ExerciseLog> exercise_logs_for_month,
  }) = _ExerciseLogsResponse;

  factory ExerciseLogsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExerciseLogsResponseFromJson(json);

  static Future<ExerciseLogsResponse> fetch(
      String id, DateTime? dateTime) async {
    final supabase = Supabase.instance.client;
    final now = DateTime.now();
    final year = dateTime?.year ?? now.year;
    final month = dateTime?.month ?? now.month;

    final response = await supabase.functions.invoke(
      'exercise/$id/$year/$month',
      method: HttpMethod.get,
    );

    if (response.data == null || response.data is! Map<String, dynamic>) {
      return const ExerciseLogsResponse(exercise_logs_for_month: []);
    }

    return ExerciseLogsResponse.fromJson(response.data as Map<String, dynamic>);
  }
}

@freezed
class ExerciseLog with _$ExerciseLog {
  const factory ExerciseLog({
    required DateTime timestamp,
  }) = _ExerciseLog;

  factory ExerciseLog.fromJson(Map<String, dynamic> json) =>
      _$ExerciseLogFromJson(json);
}
