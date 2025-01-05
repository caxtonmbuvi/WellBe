// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardState {
  Map<int, MoodModel> get moods =>
      throw _privateConstructorUsedError; // Map of Hive keys to MoodModels
  Result<void> get moodStatus => throw _privateConstructorUsedError;
  String get newQuote => throw _privateConstructorUsedError;
  WearableDataModel? get wearableData =>
      throw _privateConstructorUsedError; // New field for wearable data
  Result<void> get wearableStatus =>
      throw _privateConstructorUsedError; // Status for wearable data
  String? get wearableErrorMessage => throw _privateConstructorUsedError;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call(
      {Map<int, MoodModel> moods,
      Result<void> moodStatus,
      String newQuote,
      WearableDataModel? wearableData,
      Result<void> wearableStatus,
      String? wearableErrorMessage});

  $ResultCopyWith<void, $Res> get moodStatus;
  $WearableDataModelCopyWith<$Res>? get wearableData;
  $ResultCopyWith<void, $Res> get wearableStatus;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moods = null,
    Object? moodStatus = null,
    Object? newQuote = null,
    Object? wearableData = freezed,
    Object? wearableStatus = null,
    Object? wearableErrorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      moods: null == moods
          ? _value.moods
          : moods // ignore: cast_nullable_to_non_nullable
              as Map<int, MoodModel>,
      moodStatus: null == moodStatus
          ? _value.moodStatus
          : moodStatus // ignore: cast_nullable_to_non_nullable
              as Result<void>,
      newQuote: null == newQuote
          ? _value.newQuote
          : newQuote // ignore: cast_nullable_to_non_nullable
              as String,
      wearableData: freezed == wearableData
          ? _value.wearableData
          : wearableData // ignore: cast_nullable_to_non_nullable
              as WearableDataModel?,
      wearableStatus: null == wearableStatus
          ? _value.wearableStatus
          : wearableStatus // ignore: cast_nullable_to_non_nullable
              as Result<void>,
      wearableErrorMessage: freezed == wearableErrorMessage
          ? _value.wearableErrorMessage
          : wearableErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<void, $Res> get moodStatus {
    return $ResultCopyWith<void, $Res>(_value.moodStatus, (value) {
      return _then(_value.copyWith(moodStatus: value) as $Val);
    });
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WearableDataModelCopyWith<$Res>? get wearableData {
    if (_value.wearableData == null) {
      return null;
    }

    return $WearableDataModelCopyWith<$Res>(_value.wearableData!, (value) {
      return _then(_value.copyWith(wearableData: value) as $Val);
    });
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<void, $Res> get wearableStatus {
    return $ResultCopyWith<void, $Res>(_value.wearableStatus, (value) {
      return _then(_value.copyWith(wearableStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardStateImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$DashboardStateImplCopyWith(_$DashboardStateImpl value,
          $Res Function(_$DashboardStateImpl) then) =
      __$$DashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<int, MoodModel> moods,
      Result<void> moodStatus,
      String newQuote,
      WearableDataModel? wearableData,
      Result<void> wearableStatus,
      String? wearableErrorMessage});

  @override
  $ResultCopyWith<void, $Res> get moodStatus;
  @override
  $WearableDataModelCopyWith<$Res>? get wearableData;
  @override
  $ResultCopyWith<void, $Res> get wearableStatus;
}

/// @nodoc
class __$$DashboardStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardStateImpl>
    implements _$$DashboardStateImplCopyWith<$Res> {
  __$$DashboardStateImplCopyWithImpl(
      _$DashboardStateImpl _value, $Res Function(_$DashboardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moods = null,
    Object? moodStatus = null,
    Object? newQuote = null,
    Object? wearableData = freezed,
    Object? wearableStatus = null,
    Object? wearableErrorMessage = freezed,
  }) {
    return _then(_$DashboardStateImpl(
      moods: null == moods
          ? _value._moods
          : moods // ignore: cast_nullable_to_non_nullable
              as Map<int, MoodModel>,
      moodStatus: null == moodStatus
          ? _value.moodStatus
          : moodStatus // ignore: cast_nullable_to_non_nullable
              as Result<void>,
      newQuote: null == newQuote
          ? _value.newQuote
          : newQuote // ignore: cast_nullable_to_non_nullable
              as String,
      wearableData: freezed == wearableData
          ? _value.wearableData
          : wearableData // ignore: cast_nullable_to_non_nullable
              as WearableDataModel?,
      wearableStatus: null == wearableStatus
          ? _value.wearableStatus
          : wearableStatus // ignore: cast_nullable_to_non_nullable
              as Result<void>,
      wearableErrorMessage: freezed == wearableErrorMessage
          ? _value.wearableErrorMessage
          : wearableErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DashboardStateImpl implements _DashboardState {
  const _$DashboardStateImpl(
      {final Map<int, MoodModel> moods = const {},
      this.moodStatus = const Result<void>.empty(),
      this.newQuote = "",
      this.wearableData,
      this.wearableStatus = const Result<void>.empty(),
      this.wearableErrorMessage})
      : _moods = moods;

  final Map<int, MoodModel> _moods;
  @override
  @JsonKey()
  Map<int, MoodModel> get moods {
    if (_moods is EqualUnmodifiableMapView) return _moods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_moods);
  }

// Map of Hive keys to MoodModels
  @override
  @JsonKey()
  final Result<void> moodStatus;
  @override
  @JsonKey()
  final String newQuote;
  @override
  final WearableDataModel? wearableData;
// New field for wearable data
  @override
  @JsonKey()
  final Result<void> wearableStatus;
// Status for wearable data
  @override
  final String? wearableErrorMessage;

  @override
  String toString() {
    return 'DashboardState(moods: $moods, moodStatus: $moodStatus, newQuote: $newQuote, wearableData: $wearableData, wearableStatus: $wearableStatus, wearableErrorMessage: $wearableErrorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStateImpl &&
            const DeepCollectionEquality().equals(other._moods, _moods) &&
            (identical(other.moodStatus, moodStatus) ||
                other.moodStatus == moodStatus) &&
            (identical(other.newQuote, newQuote) ||
                other.newQuote == newQuote) &&
            (identical(other.wearableData, wearableData) ||
                other.wearableData == wearableData) &&
            (identical(other.wearableStatus, wearableStatus) ||
                other.wearableStatus == wearableStatus) &&
            (identical(other.wearableErrorMessage, wearableErrorMessage) ||
                other.wearableErrorMessage == wearableErrorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_moods),
      moodStatus,
      newQuote,
      wearableData,
      wearableStatus,
      wearableErrorMessage);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      __$$DashboardStateImplCopyWithImpl<_$DashboardStateImpl>(
          this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  const factory _DashboardState(
      {final Map<int, MoodModel> moods,
      final Result<void> moodStatus,
      final String newQuote,
      final WearableDataModel? wearableData,
      final Result<void> wearableStatus,
      final String? wearableErrorMessage}) = _$DashboardStateImpl;

  @override
  Map<int, MoodModel> get moods; // Map of Hive keys to MoodModels
  @override
  Result<void> get moodStatus;
  @override
  String get newQuote;
  @override
  WearableDataModel? get wearableData; // New field for wearable data
  @override
  Result<void> get wearableStatus; // Status for wearable data
  @override
  String? get wearableErrorMessage;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
