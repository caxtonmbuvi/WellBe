// lib/data/repositories/wearable_repository.dart

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive/hive.dart';
import 'package:interview_app/features/wearable/model/wearable_data_model.dart';

class WearableRepository {
  final Box<WearableDataModel> _wearableBox = Hive.box<WearableDataModel>('wearableBox');

  /// Loads wearable data from JSON and stores it in Hive if the box is empty.
  Future<void> loadWearableData() async {
    if (_wearableBox.isEmpty) {
      try {
        final String response = await rootBundle.loadString('assets/wearable_data.json');
        final data = json.decode(response) as Map<String, dynamic>;

        final WearableDataModel wearableData = WearableDataModel.fromJson({
          'steps': data['steps'],
          'heartRate': data['heartRate'],
          'lastUpdated': data['lastUpdated'],
        });

        await _wearableBox.add(wearableData);
        print("Wearable data loaded and saved to Hive.");
      } catch (e) {
        print("Error loading wearable data: $e");
        rethrow;
      }
    } else {
      print("Wearable data already exists in Hive.");
    }
  }

  /// Retrieves the latest wearable data.
  WearableDataModel? getLatestWearableData() {
    if (_wearableBox.isEmpty) return null;
    return _wearableBox.values.last;
  }

  /// Updates the wearable data.
  Future<void> updateWearableData(WearableDataModel data) async {
    if (_wearableBox.isEmpty) {
      await _wearableBox.add(data);
    } else {
      // Assuming the latest entry is the one to update
      final latestKey = _wearableBox.keys.last;
      await _wearableBox.put(latestKey, data);
    }
    print("Wearable data updated in Hive.");
  }
}