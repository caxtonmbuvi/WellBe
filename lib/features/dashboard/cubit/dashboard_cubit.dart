// lib/logic/cubits/dashboard_cubit/dashboard_cubit.dart

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/features/mood/model/mood_model.dart';
import 'package:interview_app/features/mood/repo/mood_repository.dart';
import 'package:interview_app/utils/model/result.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final MoodRepository moodRepository;

  DashboardCubit(this.moodRepository) : super(const DashboardState());

  /// Loads all moods from the repository.
  Future<void> loadMoods() async {
    emit(state.copyWith(moodStatus: const Result.loading()));
    try {
      // Populate fake data if Hive is empty
      await moodRepository.populateFakeData();

      final allMoods = await moodRepository.getAllMoodsWithKeys();
      emit(state.copyWith(
        moods: allMoods,
        moodStatus: const Result.success(null),
      ));
    } catch (e, st) {
      emit(state.copyWith(
        moodStatus: Result.failure(e.toString(), error: e, stack: st),
      ));
    }
  }

  /// Adds a new mood or updates an existing one for today.
  Future<void> addOrUpdateMood({
    required String mood,
    required String message,
  }) async {
    emit(state.copyWith(moodStatus: const Result.loading()));
    try {
      final today = DateTime.now();

      // Check if a mood for today already exists
      final existingEntry = state.moods.entries.firstWhere(
        (entry) => _isSameDay(entry.value.date, today),
        orElse: () =>
            MapEntry(-1, MoodModel(date: today, mood: "😊", message: "")),
      );

      if (existingEntry.key != -1) {
        // Update the existing mood
        await moodRepository.updateMood(existingEntry.key, mood, message);
      } else {
        // Add a new mood
        final newMood = MoodModel(
          date: today,
          mood: mood,
          message: message,
        );
        await moodRepository.addMood(newMood);
      }

      // Fetch a new motivational quote
      final quote = await moodRepository.fetchMotivationalMessage();

      // Reload moods
      final allMoods = await moodRepository.getAllMoodsWithKeys();
      emit(state.copyWith(
        moods: allMoods,
        moodStatus: const Result.success(null),
        newQuote: quote,
      ));
    } catch (e, st) {
      log("Error: $e");
      emit(state.copyWith(
        moodStatus: Result.failure(e.toString(), error: e, stack: st),
      ));
    }
  }

  /// Checks if two dates are on the same day.
  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  /// Retrieves the most positive mood based on the numeric scale.
  MoodModel? getMostPositiveMood() {
    if (state.moods.isEmpty) return null;
    final sortedMoods = state.moods.values.toList();
    sortedMoods
        .sort((a, b) => _mapMoodToY(b.mood).compareTo(_mapMoodToY(a.mood)));
    return sortedMoods.first;
  }

  /// Maps mood emojis to integer values.
  double _mapMoodToY(String mood) {
    switch (mood) {
      case "😡":
        return 1; // Angry
      case "😢":
        return 2; // Sad
      case "😌":
        return 3; // Calm
      case "😊":
        return 4; // Happy
      default:
        return 0; // Unknown or no mood
    }
  }
}
