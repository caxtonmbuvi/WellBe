// lib/data/repositories/onboarding_repository.dart

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class OnboardingRepository {

  /// Fetches the motivational message from local JSON (assets) or a real endpoint
  Future<String> fetchMotivationalMessage() async {
    try {
      // If simulating from a local JSON file:
      final responseStr = await rootBundle.loadString('assets/motivational_messages.json');
      final data = json.decode(responseStr);
      return data['message'] as String;

      // If calling a real API:
      // final response = await _dio.get("YOUR_API_ENDPOINT");
      // return response.data["message"];
    } catch (e) {
      rethrow;
    }
  }
}