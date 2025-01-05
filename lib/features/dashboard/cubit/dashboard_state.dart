import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interview_app/features/mood/model/mood_model.dart';
import 'package:interview_app/features/wearable/model/wearable_data_model.dart';
import 'package:interview_app/utils/model/result.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default({}) Map<int, MoodModel> moods, // Map of Hive keys to MoodModels
    @Default(Result<void>.empty()) Result<void> moodStatus,
    @Default("") String newQuote,
    WearableDataModel? wearableData, // New field for wearable data
    @Default(Result<void>.empty())
    Result<void> wearableStatus, // Status for wearable data
    String? wearableErrorMessage, // Error message for wearable data
  }) = _DashboardState;
}
