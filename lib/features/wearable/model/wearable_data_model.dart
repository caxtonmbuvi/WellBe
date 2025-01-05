// lib/data/models/wearable_data_model.dart

import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wearable_data_model.freezed.dart';
part 'wearable_data_model.g.dart';

@freezed
class WearableDataModel with _$WearableDataModel {
  @HiveType(typeId: 1, adapterName: 'WearableDataModelAdapter')
  const factory WearableDataModel({
    @HiveField(0) required int steps,
    @HiveField(1) required int heartRate,
    @HiveField(2) required DateTime lastUpdated,
  }) = _WearableDataModel;

  factory WearableDataModel.fromJson(Map<String, dynamic> json) =>
      _$WearableDataModelFromJson(json);
}