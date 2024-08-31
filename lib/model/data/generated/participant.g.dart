// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantImpl _$$ParticipantImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantImpl(
      user_id: json['user_id'] as String,
      name: json['name'] as String,
      iconUrl: json['iconUrl'] as String,
    );

Map<String, dynamic> _$$ParticipantImplToJson(_$ParticipantImpl instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
    };
