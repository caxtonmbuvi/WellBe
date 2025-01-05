// lib/logic/cubits/onboarding_cubit/onboarding_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interview_app/utils/model/result.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    /// Tracks the current status of fetching the message
    @Default(Result<String>.empty()) Result<String> fetchStatus,

    /// The motivational message we’ve fetched (or empty if not fetched yet)
    @Default("") String message,
  }) = _OnboardingState;
}