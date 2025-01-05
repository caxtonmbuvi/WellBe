// lib/logic/cubits/wearable_cubit/wearable_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interview_app/features/wearable/model/wearable_data_model.dart';

part 'wearable_state.freezed.dart';

enum WearableStatus { initial, loading, success, failure }

@freezed
class WearableState with _$WearableState {
  const factory WearableState({
    @Default(WearableStatus.initial) WearableStatus status,
    WearableDataModel? wearableData,
    String? errorMessage,
  }) = _WearableState;
}