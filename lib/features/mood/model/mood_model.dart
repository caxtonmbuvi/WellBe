// lib/data/models/mood_model.dart

import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mood_model.freezed.dart';
part 'mood_model.g.dart';

@freezed
class MoodModel with _$MoodModel {
  @HiveType(typeId: 0, adapterName: 'MoodModelAdapter')
  const factory MoodModel({
    @HiveField(0) required DateTime date,
    @HiveField(1) required String mood, // e.g., "😊", "😢", etc.
    @HiveField(2) required String message, // User’s custom message
  }) = _MoodModel;

  factory MoodModel.fromJson(Map<String, dynamic> json) => _$MoodModelFromJson(json);
}