import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/exercise_logs_response.freezed.dart';
part 'generated/exercise_logs_response.g.dart';

@freezed
class ExerciseLogsResponse with _$ExerciseLogsResponse {
  const factory ExerciseLogsResponse({
    required List<ExerciseLog> exerciseLogsForMonth,
  }) = _ExerciseLogsResponse;

  factory ExerciseLogsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExerciseLogsResponseFromJson(json);
}

@freezed
class ExerciseLog with _$ExerciseLog {
  const factory ExerciseLog({
    required DateTime timestamp,
  }) = _ExerciseLog;

  factory ExerciseLog.fromJson(Map<String, dynamic> json) =>
      _$ExerciseLogFromJson(json);
}
