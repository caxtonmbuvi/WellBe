// lib/logic/cubits/journal_cubit/journal_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interview_app/features/journal/model/journal_data.dart';
import 'package:interview_app/utils/model/result.dart';

part 'journal_state.freezed.dart';

@freezed
class JournalState with _$JournalState {
  const factory JournalState({
    /// Holds the current state of our journal data fetch
    @Default(Result<JournalData>.empty()) Result<JournalData> journalResult,
  }) = _JournalState;
}