// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../profile_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  UserProfile? get userProfile => throw _privateConstructorUsedError;
  ExerciseLogsResponse? get exerciseLogs => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {UserProfile? userProfile,
      ExerciseLogsResponse? exerciseLogs,
      DateTime? selectedDate});

  $UserProfileCopyWith<$Res>? get userProfile;
  $ExerciseLogsResponseCopyWith<$Res>? get exerciseLogs;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = freezed,
    Object? exerciseLogs = freezed,
    Object? selectedDate = freezed,
  }) {
    return _then(_value.copyWith(
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      exerciseLogs: freezed == exerciseLogs
          ? _value.exerciseLogs
          : exerciseLogs // ignore: cast_nullable_to_non_nullable
              as ExerciseLogsResponse?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get userProfile {
    if (_value.userProfile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.userProfile!, (value) {
      return _then(_value.copyWith(userProfile: value) as $Val);
    });
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExerciseLogsResponseCopyWith<$Res>? get exerciseLogs {
    if (_value.exerciseLogs == null) {
      return null;
    }

    return $ExerciseLogsResponseCopyWith<$Res>(_value.exerciseLogs!, (value) {
      return _then(_value.copyWith(exerciseLogs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserProfile? userProfile,
      ExerciseLogsResponse? exerciseLogs,
      DateTime? selectedDate});

  @override
  $UserProfileCopyWith<$Res>? get userProfile;
  @override
  $ExerciseLogsResponseCopyWith<$Res>? get exerciseLogs;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = freezed,
    Object? exerciseLogs = freezed,
    Object? selectedDate = freezed,
  }) {
    return _then(_$ProfileStateImpl(
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      exerciseLogs: freezed == exerciseLogs
          ? _value.exerciseLogs
          : exerciseLogs // ignore: cast_nullable_to_non_nullable
              as ExerciseLogsResponse?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {this.userProfile, this.exerciseLogs, this.selectedDate});

  @override
  final UserProfile? userProfile;
  @override
  final ExerciseLogsResponse? exerciseLogs;
  @override
  final DateTime? selectedDate;

  @override
  String toString() {
    return 'ProfileState(userProfile: $userProfile, exerciseLogs: $exerciseLogs, selectedDate: $selectedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.exerciseLogs, exerciseLogs) ||
                other.exerciseLogs == exerciseLogs) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userProfile, exerciseLogs, selectedDate);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {final UserProfile? userProfile,
      final ExerciseLogsResponse? exerciseLogs,
      final DateTime? selectedDate}) = _$ProfileStateImpl;

  @override
  UserProfile? get userProfile;
  @override
  ExerciseLogsResponse? get exerciseLogs;
  @override
  DateTime? get selectedDate;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
