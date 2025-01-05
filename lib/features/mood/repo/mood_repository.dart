
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive/hive.dart';
import 'package:interview_app/features/mood/model/mood_model.dart';

class MoodRepository {
  final Box<MoodModel> _moodBox = Hive.box<MoodModel>('moodsBox');

  /// Adds a new mood to the Hive box.
  Future<void> addMood(MoodModel mood) async {
    await _moodBox.add(mood);
  }

  /// Updates an existing mood in the Hive box.
  Future<void> updateMood(int key, String newMood, String newMessage) async {
    final existingMood = _moodBox.get(key);
    if (existingMood != null) {
      final updatedMood = existingMood.copyWith(
        mood: newMood,
        message: newMessage,
      );
      await _moodBox.put(key, updatedMood);
    }
  }

  /// Retrieves all moods from the Hive box.
  Future<List<MoodModel>> getAllMoods() async {
    return _moodBox.values.toList();
  }

  /// Retrieves all moods with their Hive keys.
  Future<Map<int, MoodModel>> getAllMoodsWithKeys() async {
    return _moodBox.toMap().cast<int, MoodModel>();
  }

  /// Fetches a motivational message from a local JSON file.
  Future<String> fetchMotivationalMessage() async {
    final String response = await rootBundle.loadString('assets/motivational_messages.json');
    final data = await json.decode(response) as Map<String, dynamic>;
    final String messages = data['message'];

    return messages;
  }

  /// Populates Hive with fake mood data if empty.
  Future<void> populateFakeData() async {
    if (_moodBox.isEmpty) {
      final String response = await rootBundle.loadString('assets/fake_moods.json');
      final data = await json.decode(response) as Map<String, dynamic>;
      final List<dynamic> moodsJson = data['moods'];

      final List<MoodModel> fakeMoods = moodsJson.map((moodJson) {
        String dateStr = moodJson['date'];
        DateTime date;

        switch (dateStr) {
          case "TODAY":
            date = DateTime.now();
            break;
          case "YESTERDAY":
            date = DateTime.now().subtract(const Duration(days: 1));
            break;
          case "2_DAYS_AGO":
            date = DateTime.now().subtract(const Duration(days: 2));
            break;
          case "3_DAYS_AGO":
            date = DateTime.now().subtract(const Duration(days: 3));
            break;
          case "4_DAYS_AGO":
            date = DateTime.now().subtract(const Duration(days: 4));
            break;
          case "5_DAYS_AGO":
            date = DateTime.now().subtract(const Duration(days: 5));
            break;
          case "6_DAYS_AGO":
            date = DateTime.now().subtract(const Duration(days: 6));
            break;
          default:
            date = DateTime.now();
        }

        print("Adding fake mood: ${moodJson['mood']} on ${date.toLocal()}");

        return MoodModel(
          date: date,
          mood: moodJson['mood'],
          message: moodJson['message'],
        );
      }).toList();

      for (var mood in fakeMoods) {
        await _moodBox.add(mood);
        print("Added mood: ${mood.mood} on ${mood.date.toLocal()}");
      }
    } else {
      print("Hive box 'moodsBox' is not empty. Skipping fake data population.");
    }
  }


  /// Json list of Fake Data that can be used to simulate week long data.
  /// Steps : Copy the list of moods to the fake_moods.json file,Delete the app from your device to ensure the local db is cleaned up.
  ///         Once you restart the app,you will have data for the previous days

  // "moods": [
    
  //   {
  //     "date": "YESTERDAY",
  //     "mood": "😌",
  //     "message": "Pretty calm today."
  //   },
  //   {
  //     "date": "2_DAYS_AGO",
  //     "mood": "😢",
  //     "message": "Had a tough day."
  //   },
  //   {
  //     "date": "3_DAYS_AGO",
  //     "mood": "😊",
  //     "message": "Back to feeling awesome!"
  //   },
  //   {
  //     "date": "4_DAYS_AGO",
  //     "mood": "😌",
  //     "message": "Relaxing at home."
  //   },
  //   {
  //     "date": "5_DAYS_AGO",
  //     "mood": "😡",
  //     "message": "Frustrated with work."
  //   },
  //   {
  //     "date": "6_DAYS_AGO",
  //     "mood": "😊",
  //     "message": "Excited for the weekend!"
  //   }
  // ]
}