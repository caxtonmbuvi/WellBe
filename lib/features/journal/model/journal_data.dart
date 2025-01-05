// lib/features/journal/model/journal_data.dart

import 'package:interview_app/features/journal/model/journal_entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_data.freezed.dart';

@freezed
class JournalData with _$JournalData {
  const factory JournalData({
    required String motivationalMessage,
    required int steps,
    required List<JournalEntry> entries,
  }) = _JournalData;
}