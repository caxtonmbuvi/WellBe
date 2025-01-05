// lib/logic/cubits/journal_cubit/journal_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:interview_app/features/journal/model/journal_data.dart';
import 'package:interview_app/features/journal/model/journal_entry.dart';
import 'package:interview_app/utils/model/result.dart';

import 'journal_state.dart';

class JournalCubit extends Cubit<JournalState> {
  JournalCubit() : super(const JournalState());

  late Box _journalBox;

  Future<void> init() async {
    // Emit a loading state
    emit(state.copyWith(journalResult: const Result.loading()));
    try {
      // Open the Hive Box
      _journalBox = await Hive.openBox('journalEntries');
      // After opening, fetch data
      await fetchData();
    } catch (e, stack) {
      emit(
        state.copyWith(
          journalResult: Result.failure(
            e.toString(),
            error: e,
            stack: stack,
          ),
        ),
      );
    }
  }

  Future<void> fetchData() async {
    try {
      // 1. Fetch local wearable data
      final wearableStr =
          await rootBundle.loadString('assets/wearable_data.json');
      final wearableData = json.decode(wearableStr);
      final steps = wearableData['steps'] as int;

      // 2. Fetch motivational message
      final messageStr =
          await rootBundle.loadString('assets/motivational_messages.json');
      final messageJson = json.decode(messageStr);
      final motivationalMessage = messageJson["message"] as String;

      // 3. Read existing journal entries from Hive
      final entries = <JournalEntry>[];
      for (var map in _journalBox.values) {
        final m = map as Map;
        entries.add(
          JournalEntry(
            text: m['text'],
            date: DateTime.parse(m['date']),
            mood: m['mood'],
          ),
        );
      }

      // Build our JournalData
      final data = JournalData(
        motivationalMessage: motivationalMessage,
        steps: steps,
        entries: entries,
      );

      // Emit success
      emit(state.copyWith(journalResult: Result.success(data)));
    } catch (e, stack) {
      emit(
        state.copyWith(
          journalResult: Result.failure(
            e.toString(),
            error: e,
            stack: stack,
          ),
        ),
      );
    }
  }

  Future<void> saveJournalEntry(String text, String mood) async {
    // Check if we have valid data currently
    final currentData = state.journalResult.maybeMap(
      success: (value) => value.result,
      orElse: () => null,
    );

    if (currentData == null) {
      return; // If we don't have success data, do nothing
    }

    final newEntry = JournalEntry(
      text: text,
      mood: mood,
      date: DateTime.now(),
    );

    try {
      // Save to Hive as Map
      await _journalBox.add({
        'text': newEntry.text,
        'mood': newEntry.mood,
        'date': newEntry.date.toIso8601String(),
      });

      // Create an updated list of entries
      final updatedEntries = List<JournalEntry>.from(currentData.entries)
        ..add(newEntry);

      // Create updated JournalData
      final updatedData = currentData.copyWith(entries: updatedEntries);

      // Emit success with updated data
      emit(
        state.copyWith(
          journalResult: Result.success(updatedData),
        ),
      );
    } catch (e, stack) {
      emit(
        state.copyWith(
          journalResult: Result.failure(
            e.toString(),
            error: e,
            stack: stack,
          ),
        ),
      );
    }
  }
}