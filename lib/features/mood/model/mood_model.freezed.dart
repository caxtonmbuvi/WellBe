// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoodModel _$MoodModelFromJson(Map<String, dynamic> json) {
  return _MoodModel.fromJson(json);
}

/// @nodoc
mixin _$MoodModel {
  @HiveField(0)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(1)
  String get mood =>
      throw _privateConstructorUsedError; // e.g., "😊", "😢", etc.
  @HiveField(2)
  String get message => throw _privateConstructorUsedError;

  /// Serializes this MoodModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MoodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoodModelCopyWith<MoodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodModelCopyWith<$Res> {
  factory $MoodModelCopyWith(MoodModel value, $Res Function(MoodModel) then) =
      _$MoodModelCopyWithImpl<$Res, MoodModel>;
  @useResult
  $Res call(
      {@HiveField(0) DateTime date,
      @HiveField(1) String mood,
      @HiveField(2) String message});
}

/// @nodoc
class _$MoodModelCopyWithImpl<$Res, $Val extends MoodModel>
    implements $MoodModelCopyWith<$Res> {
  _$MoodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? mood = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoodModelImplCopyWith<$Res>
    implements $MoodModelCopyWith<$Res> {
  factory _$$MoodModelImplCopyWith(
          _$MoodModelImpl value, $Res Function(_$MoodModelImpl) then) =
      __$$MoodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) DateTime date,
      @HiveField(1) String mood,
      @HiveField(2) String message});
}

/// @nodoc
class __$$MoodModelImplCopyWithImpl<$Res>
    extends _$MoodModelCopyWithImpl<$Res, _$MoodModelImpl>
    implements _$$MoodModelImplCopyWith<$Res> {
  __$$MoodModelImplCopyWithImpl(
      _$MoodModelImpl _value, $Res Function(_$MoodModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? mood = null,
    Object? message = null,
  }) {
    return _then(_$MoodModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'MoodModelAdapter')
class _$MoodModelImpl implements _MoodModel {
  const _$MoodModelImpl(
      {@HiveField(0) required this.date,
      @HiveField(1) required this.mood,
      @HiveField(2) required this.message});

  factory _$MoodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoodModelImplFromJson(json);

  @override
  @HiveField(0)
  final DateTime date;
  @override
  @HiveField(1)
  final String mood;
// e.g., "😊", "😢", etc.
  @override
  @HiveField(2)
  final String message;

  @override
  String toString() {
    return 'MoodModel(date: $date, mood: $mood, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, mood, message);

  /// Create a copy of MoodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodModelImplCopyWith<_$MoodModelImpl> get copyWith =>
      __$$MoodModelImplCopyWithImpl<_$MoodModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoodModelImplToJson(
      this,
    );
  }
}

abstract class _MoodModel implements MoodModel {
  const factory _MoodModel(
      {@HiveField(0) required final DateTime date,
      @HiveField(1) required final String mood,
      @HiveField(2) required final String message}) = _$MoodModelImpl;

  factory _MoodModel.fromJson(Map<String, dynamic> json) =
      _$MoodModelImpl.fromJson;

  @override
  @HiveField(0)
  DateTime get date;
  @override
  @HiveField(1)
  String get mood; // e.g., "😊", "😢", etc.
  @override
  @HiveField(2)
  String get message;

  /// Create a copy of MoodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoodModelImplCopyWith<_$MoodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
