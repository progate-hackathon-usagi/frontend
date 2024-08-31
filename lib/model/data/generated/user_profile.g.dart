// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      total_exercise_day_count:
          (json['total_exercise_day_count'] as num).toInt(),
      current_exercise_day_streak:
          (json['current_exercise_day_streak'] as num).toInt(),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'total_exercise_day_count': instance.total_exercise_day_count,
      'current_exercise_day_streak': instance.current_exercise_day_streak,
    };
