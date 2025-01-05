// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodModelAdapter extends TypeAdapter<_$MoodModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$MoodModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MoodModelImpl(
      date: fields[0] as DateTime,
      mood: fields[1] as String,
      message: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$MoodModelImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.mood)
      ..writeByte(2)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoodModelImpl _$$MoodModelImplFromJson(Map<String, dynamic> json) =>
    _$MoodModelImpl(
      date: DateTime.parse(json['date'] as String),
      mood: json['mood'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$MoodModelImplToJson(_$MoodModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'mood': instance.mood,
      'message': instance.message,
    };
