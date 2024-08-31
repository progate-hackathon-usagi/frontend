// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../exercise_logs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseLogsResponseImpl _$$ExerciseLogsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseLogsResponseImpl(
      exercise_logs_for_month:
          (json['exercise_logs_for_month'] as List<dynamic>)
              .map((e) => ExerciseLog.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$ExerciseLogsResponseImplToJson(
        _$ExerciseLogsResponseImpl instance) =>
    <String, dynamic>{
      'exercise_logs_for_month': instance.exercise_logs_for_month,
    };

_$ExerciseLogImpl _$$ExerciseLogImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseLogImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ExerciseLogImplToJson(_$ExerciseLogImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
    };
