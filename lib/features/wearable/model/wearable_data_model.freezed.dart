// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wearable_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WearableDataModel _$WearableDataModelFromJson(Map<String, dynamic> json) {
  return _WearableDataModel.fromJson(json);
}

/// @nodoc
mixin _$WearableDataModel {
  @HiveField(0)
  int get steps => throw _privateConstructorUsedError;
  @HiveField(1)
  int get heartRate => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this WearableDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WearableDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WearableDataModelCopyWith<WearableDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WearableDataModelCopyWith<$Res> {
  factory $WearableDataModelCopyWith(
          WearableDataModel value, $Res Function(WearableDataModel) then) =
      _$WearableDataModelCopyWithImpl<$Res, WearableDataModel>;
  @useResult
  $Res call(
      {@HiveField(0) int steps,
      @HiveField(1) int heartRate,
      @HiveField(2) DateTime lastUpdated});
}

/// @nodoc
class _$WearableDataModelCopyWithImpl<$Res, $Val extends WearableDataModel>
    implements $WearableDataModelCopyWith<$Res> {
  _$WearableDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WearableDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? heartRate = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      heartRate: null == heartRate
          ? _value.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WearableDataModelImplCopyWith<$Res>
    implements $WearableDataModelCopyWith<$Res> {
  factory _$$WearableDataModelImplCopyWith(_$WearableDataModelImpl value,
          $Res Function(_$WearableDataModelImpl) then) =
      __$$WearableDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int steps,
      @HiveField(1) int heartRate,
      @HiveField(2) DateTime lastUpdated});
}

/// @nodoc
class __$$WearableDataModelImplCopyWithImpl<$Res>
    extends _$WearableDataModelCopyWithImpl<$Res, _$WearableDataModelImpl>
    implements _$$WearableDataModelImplCopyWith<$Res> {
  __$$WearableDataModelImplCopyWithImpl(_$WearableDataModelImpl _value,
      $Res Function(_$WearableDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WearableDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? heartRate = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$WearableDataModelImpl(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      heartRate: null == heartRate
          ? _value.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'WearableDataModelAdapter')
class _$WearableDataModelImpl implements _WearableDataModel {
  const _$WearableDataModelImpl(
      {@HiveField(0) required this.steps,
      @HiveField(1) required this.heartRate,
      @HiveField(2) required this.lastUpdated});

  factory _$WearableDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WearableDataModelImplFromJson(json);

  @override
  @HiveField(0)
  final int steps;
  @override
  @HiveField(1)
  final int heartRate;
  @override
  @HiveField(2)
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'WearableDataModel(steps: $steps, heartRate: $heartRate, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WearableDataModelImpl &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, steps, heartRate, lastUpdated);

  /// Create a copy of WearableDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WearableDataModelImplCopyWith<_$WearableDataModelImpl> get copyWith =>
      __$$WearableDataModelImplCopyWithImpl<_$WearableDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WearableDataModelImplToJson(
      this,
    );
  }
}

abstract class _WearableDataModel implements WearableDataModel {
  const factory _WearableDataModel(
          {@HiveField(0) required final int steps,
          @HiveField(1) required final int heartRate,
          @HiveField(2) required final DateTime lastUpdated}) =
      _$WearableDataModelImpl;

  factory _WearableDataModel.fromJson(Map<String, dynamic> json) =
      _$WearableDataModelImpl.fromJson;

  @override
  @HiveField(0)
  int get steps;
  @override
  @HiveField(1)
  int get heartRate;
  @override
  @HiveField(2)
  DateTime get lastUpdated;

  /// Create a copy of WearableDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WearableDataModelImplCopyWith<_$WearableDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
