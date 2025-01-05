// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wearable_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WearableState {
  WearableStatus get status => throw _privateConstructorUsedError;
  WearableDataModel? get wearableData => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of WearableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WearableStateCopyWith<WearableState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WearableStateCopyWith<$Res> {
  factory $WearableStateCopyWith(
          WearableState value, $Res Function(WearableState) then) =
      _$WearableStateCopyWithImpl<$Res, WearableState>;
  @useResult
  $Res call(
      {WearableStatus status,
      WearableDataModel? wearableData,
      String? errorMessage});

  $WearableDataModelCopyWith<$Res>? get wearableData;
}

/// @nodoc
class _$WearableStateCopyWithImpl<$Res, $Val extends WearableState>
    implements $WearableStateCopyWith<$Res> {
  _$WearableStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WearableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? wearableData = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WearableStatus,
      wearableData: freezed == wearableData
          ? _value.wearableData
          : wearableData // ignore: cast_nullable_to_non_nullable
              as WearableDataModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of WearableState
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
}

/// @nodoc
abstract class _$$WearableStateImplCopyWith<$Res>
    implements $WearableStateCopyWith<$Res> {
  factory _$$WearableStateImplCopyWith(
          _$WearableStateImpl value, $Res Function(_$WearableStateImpl) then) =
      __$$WearableStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WearableStatus status,
      WearableDataModel? wearableData,
      String? errorMessage});

  @override
  $WearableDataModelCopyWith<$Res>? get wearableData;
}

/// @nodoc
class __$$WearableStateImplCopyWithImpl<$Res>
    extends _$WearableStateCopyWithImpl<$Res, _$WearableStateImpl>
    implements _$$WearableStateImplCopyWith<$Res> {
  __$$WearableStateImplCopyWithImpl(
      _$WearableStateImpl _value, $Res Function(_$WearableStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WearableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? wearableData = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$WearableStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WearableStatus,
      wearableData: freezed == wearableData
          ? _value.wearableData
          : wearableData // ignore: cast_nullable_to_non_nullable
              as WearableDataModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WearableStateImpl implements _WearableState {
  const _$WearableStateImpl(
      {this.status = WearableStatus.initial,
      this.wearableData,
      this.errorMessage});

  @override
  @JsonKey()
  final WearableStatus status;
  @override
  final WearableDataModel? wearableData;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'WearableState(status: $status, wearableData: $wearableData, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WearableStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.wearableData, wearableData) ||
                other.wearableData == wearableData) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, wearableData, errorMessage);

  /// Create a copy of WearableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WearableStateImplCopyWith<_$WearableStateImpl> get copyWith =>
      __$$WearableStateImplCopyWithImpl<_$WearableStateImpl>(this, _$identity);
}

abstract class _WearableState implements WearableState {
  const factory _WearableState(
      {final WearableStatus status,
      final WearableDataModel? wearableData,
      final String? errorMessage}) = _$WearableStateImpl;

  @override
  WearableStatus get status;
  @override
  WearableDataModel? get wearableData;
  @override
  String? get errorMessage;

  /// Create a copy of WearableState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WearableStateImplCopyWith<_$WearableStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
