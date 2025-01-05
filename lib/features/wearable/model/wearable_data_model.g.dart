// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wearable_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WearableDataModelAdapter extends TypeAdapter<_$WearableDataModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$WearableDataModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$WearableDataModelImpl(
      steps: fields[0] as int,
      heartRate: fields[1] as int,
      lastUpdated: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$WearableDataModelImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.steps)
      ..writeByte(1)
      ..write(obj.heartRate)
      ..writeByte(2)
      ..write(obj.lastUpdated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WearableDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WearableDataModelImpl _$$WearableDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WearableDataModelImpl(
      steps: (json['steps'] as num).toInt(),
      heartRate: (json['heartRate'] as num).toInt(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$WearableDataModelImplToJson(
        _$WearableDataModelImpl instance) =>
    <String, dynamic>{
      'steps': instance.steps,
      'heartRate': instance.heartRate,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
