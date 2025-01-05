// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JournalData {
  String get motivationalMessage => throw _privateConstructorUsedError;
  int get steps => throw _privateConstructorUsedError;
  List<JournalEntry> get entries => throw _privateConstructorUsedError;

  /// Create a copy of JournalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalDataCopyWith<JournalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalDataCopyWith<$Res> {
  factory $JournalDataCopyWith(
          JournalData value, $Res Function(JournalData) then) =
      _$JournalDataCopyWithImpl<$Res, JournalData>;
  @useResult
  $Res call(
      {String motivationalMessage, int steps, List<JournalEntry> entries});
}

/// @nodoc
class _$JournalDataCopyWithImpl<$Res, $Val extends JournalData>
    implements $JournalDataCopyWith<$Res> {
  _$JournalDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motivationalMessage = null,
    Object? steps = null,
    Object? entries = null,
  }) {
    return _then(_value.copyWith(
      motivationalMessage: null == motivationalMessage
          ? _value.motivationalMessage
          : motivationalMessage // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<JournalEntry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JournalDataImplCopyWith<$Res>
    implements $JournalDataCopyWith<$Res> {
  factory _$$JournalDataImplCopyWith(
          _$JournalDataImpl value, $Res Function(_$JournalDataImpl) then) =
      __$$JournalDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String motivationalMessage, int steps, List<JournalEntry> entries});
}

/// @nodoc
class __$$JournalDataImplCopyWithImpl<$Res>
    extends _$JournalDataCopyWithImpl<$Res, _$JournalDataImpl>
    implements _$$JournalDataImplCopyWith<$Res> {
  __$$JournalDataImplCopyWithImpl(
      _$JournalDataImpl _value, $Res Function(_$JournalDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motivationalMessage = null,
    Object? steps = null,
    Object? entries = null,
  }) {
    return _then(_$JournalDataImpl(
      motivationalMessage: null == motivationalMessage
          ? _value.motivationalMessage
          : motivationalMessage // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<JournalEntry>,
    ));
  }
}

/// @nodoc

class _$JournalDataImpl implements _JournalData {
  const _$JournalDataImpl(
      {required this.motivationalMessage,
      required this.steps,
      required final List<JournalEntry> entries})
      : _entries = entries;

  @override
  final String motivationalMessage;
  @override
  final int steps;
  final List<JournalEntry> _entries;
  @override
  List<JournalEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'JournalData(motivationalMessage: $motivationalMessage, steps: $steps, entries: $entries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalDataImpl &&
            (identical(other.motivationalMessage, motivationalMessage) ||
                other.motivationalMessage == motivationalMessage) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, motivationalMessage, steps,
      const DeepCollectionEquality().hash(_entries));

  /// Create a copy of JournalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalDataImplCopyWith<_$JournalDataImpl> get copyWith =>
      __$$JournalDataImplCopyWithImpl<_$JournalDataImpl>(this, _$identity);
}

abstract class _JournalData implements JournalData {
  const factory _JournalData(
      {required final String motivationalMessage,
      required final int steps,
      required final List<JournalEntry> entries}) = _$JournalDataImpl;

  @override
  String get motivationalMessage;
  @override
  int get steps;
  @override
  List<JournalEntry> get entries;

  /// Create a copy of JournalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalDataImplCopyWith<_$JournalDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
