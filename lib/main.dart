import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:interview_app/app.dart';
import 'package:interview_app/features/mood/model/mood_model.dart';
import 'package:interview_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:interview_app/features/wearable/model/wearable_data_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register the adapter
  Hive.registerAdapter(MoodModelAdapter());
  Hive.registerAdapter(WearableDataModelAdapter());

  // Open the box (database)
  await Hive.openBox<MoodModel>('moodsBox');
  await Hive.openBox<WearableDataModel>('wearableBox');
  runApp(
    App(
      widget: OnboardingScreen(),
    ),
  );
}
