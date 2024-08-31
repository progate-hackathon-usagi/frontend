// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../exercise_logs_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExerciseLogsResponse _$ExerciseLogsResponseFromJson(Map<String, dynamic> json) {
  return _ExerciseLogsResponse.fromJson(json);
}

/// @nodoc
mixin _$ExerciseLogsResponse {
  List<ExerciseLog> get exerciseLogsForMonth =>
      throw _privateConstructorUsedError;

  /// Serializes this ExerciseLogsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseLogsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseLogsResponseCopyWith<ExerciseLogsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseLogsResponseCopyWith<$Res> {
  factory $ExerciseLogsResponseCopyWith(ExerciseLogsResponse value,
          $Res Function(ExerciseLogsResponse) then) =
      _$ExerciseLogsResponseCopyWithImpl<$Res, ExerciseLogsResponse>;
  @useResult
  $Res call({List<ExerciseLog> exerciseLogsForMonth});
}

/// @nodoc
class _$ExerciseLogsResponseCopyWithImpl<$Res,
        $Val extends ExerciseLogsResponse>
    implements $ExerciseLogsResponseCopyWith<$Res> {
  _$ExerciseLogsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseLogsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseLogsForMonth = null,
  }) {
    return _then(_value.copyWith(
      exerciseLogsForMonth: null == exerciseLogsForMonth
          ? _value.exerciseLogsForMonth
          : exerciseLogsForMonth // ignore: cast_nullable_to_non_nullable
              as List<ExerciseLog>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseLogsResponseImplCopyWith<$Res>
    implements $ExerciseLogsResponseCopyWith<$Res> {
  factory _$$ExerciseLogsResponseImplCopyWith(_$ExerciseLogsResponseImpl value,
          $Res Function(_$ExerciseLogsResponseImpl) then) =
      __$$ExerciseLogsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ExerciseLog> exerciseLogsForMonth});
}

/// @nodoc
class __$$ExerciseLogsResponseImplCopyWithImpl<$Res>
    extends _$ExerciseLogsResponseCopyWithImpl<$Res, _$ExerciseLogsResponseImpl>
    implements _$$ExerciseLogsResponseImplCopyWith<$Res> {
  __$$ExerciseLogsResponseImplCopyWithImpl(_$ExerciseLogsResponseImpl _value,
      $Res Function(_$ExerciseLogsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExerciseLogsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseLogsForMonth = null,
  }) {
    return _then(_$ExerciseLogsResponseImpl(
      exerciseLogsForMonth: null == exerciseLogsForMonth
          ? _value._exerciseLogsForMonth
          : exerciseLogsForMonth // ignore: cast_nullable_to_non_nullable
              as List<ExerciseLog>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseLogsResponseImpl implements _ExerciseLogsResponse {
  const _$ExerciseLogsResponseImpl(
      {required final List<ExerciseLog> exerciseLogsForMonth})
      : _exerciseLogsForMonth = exerciseLogsForMonth;

  factory _$ExerciseLogsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseLogsResponseImplFromJson(json);

  final List<ExerciseLog> _exerciseLogsForMonth;
  @override
  List<ExerciseLog> get exerciseLogsForMonth {
    if (_exerciseLogsForMonth is EqualUnmodifiableListView)
      return _exerciseLogsForMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exerciseLogsForMonth);
  }

  @override
  String toString() {
    return 'ExerciseLogsResponse(exerciseLogsForMonth: $exerciseLogsForMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseLogsResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._exerciseLogsForMonth, _exerciseLogsForMonth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_exerciseLogsForMonth));

  /// Create a copy of ExerciseLogsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseLogsResponseImplCopyWith<_$ExerciseLogsResponseImpl>
      get copyWith =>
          __$$ExerciseLogsResponseImplCopyWithImpl<_$ExerciseLogsResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseLogsResponseImplToJson(
      this,
    );
  }
}

abstract class _ExerciseLogsResponse implements ExerciseLogsResponse {
  const factory _ExerciseLogsResponse(
          {required final List<ExerciseLog> exerciseLogsForMonth}) =
      _$ExerciseLogsResponseImpl;

  factory _ExerciseLogsResponse.fromJson(Map<String, dynamic> json) =
      _$ExerciseLogsResponseImpl.fromJson;

  @override
  List<ExerciseLog> get exerciseLogsForMonth;

  /// Create a copy of ExerciseLogsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseLogsResponseImplCopyWith<_$ExerciseLogsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ExerciseLog _$ExerciseLogFromJson(Map<String, dynamic> json) {
  return _ExerciseLog.fromJson(json);
}

/// @nodoc
mixin _$ExerciseLog {
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this ExerciseLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseLogCopyWith<ExerciseLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseLogCopyWith<$Res> {
  factory $ExerciseLogCopyWith(
          ExerciseLog value, $Res Function(ExerciseLog) then) =
      _$ExerciseLogCopyWithImpl<$Res, ExerciseLog>;
  @useResult
  $Res call({DateTime timestamp});
}

/// @nodoc
class _$ExerciseLogCopyWithImpl<$Res, $Val extends ExerciseLog>
    implements $ExerciseLogCopyWith<$Res> {
  _$ExerciseLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseLogImplCopyWith<$Res>
    implements $ExerciseLogCopyWith<$Res> {
  factory _$$ExerciseLogImplCopyWith(
          _$ExerciseLogImpl value, $Res Function(_$ExerciseLogImpl) then) =
      __$$ExerciseLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime timestamp});
}

/// @nodoc
class __$$ExerciseLogImplCopyWithImpl<$Res>
    extends _$ExerciseLogCopyWithImpl<$Res, _$ExerciseLogImpl>
    implements _$$ExerciseLogImplCopyWith<$Res> {
  __$$ExerciseLogImplCopyWithImpl(
      _$ExerciseLogImpl _value, $Res Function(_$ExerciseLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExerciseLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
  }) {
    return _then(_$ExerciseLogImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseLogImpl implements _ExerciseLog {
  const _$ExerciseLogImpl({required this.timestamp});

  factory _$ExerciseLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseLogImplFromJson(json);

  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'ExerciseLog(timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseLogImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp);

  /// Create a copy of ExerciseLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseLogImplCopyWith<_$ExerciseLogImpl> get copyWith =>
      __$$ExerciseLogImplCopyWithImpl<_$ExerciseLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseLogImplToJson(
      this,
    );
  }
}

abstract class _ExerciseLog implements ExerciseLog {
  const factory _ExerciseLog({required final DateTime timestamp}) =
      _$ExerciseLogImpl;

  factory _ExerciseLog.fromJson(Map<String, dynamic> json) =
      _$ExerciseLogImpl.fromJson;

  @override
  DateTime get timestamp;

  /// Create a copy of ExerciseLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseLogImplCopyWith<_$ExerciseLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
