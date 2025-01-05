# Mood Tracker App 🌟

![Flutter](https://img.shields.io/badge/Flutter-v3.7.12-blue.svg)
![Dart](https://img.shields.io/badge/Dart-v2.19.6-blue.svg)
![Hive](https://img.shields.io/badge/Hive-v2.2.3-purple.svg)
![Bloc](https://img.shields.io/badge/Bloc-v8.1.1-green.svg)
![Freezed](https://img.shields.io/badge/Freezed-v2.3.2-yellow.svg)

Welcome to the **Mood Tracker App**! 🎉 An intuitive and engaging mobile application designed to help you monitor your daily moods, track your wearable data, and journal your thoughts—all in one place. Whether you're looking to gain insights into your emotional well-being or simply want a convenient way to record your day, Mood Tracker has got you covered!

![Simulator Screenshot - iPhone 16 Pro - 2025-01-05 at 23 27 39](https://github.com/user-attachments/assets/3c502298-e040-43c0-8721-729bc939630d)


## 🚀 Features

- **Mood Logging:** Easily record your daily moods with a selection of expressive emojis.
- **Wearable Data Integration:** Syncs with your wearable devices to display your daily steps and heart rate.
- **Journal Entries:** Capture your thoughts and feelings in personalized journal entries.
- **Motivational Messages:** Receive uplifting quotes to inspire your day.
- **Interactive Dashboard:** Visualize your mood trends and wearable data through dynamic bar charts.
- **Local Data Persistence:** All your data is securely stored locally using Hive, ensuring privacy and quick access.

---

## 📸 Screenshots

*(Add screenshots of your app here to showcase its features and UI.)*

---

## 🛠️ Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### 🎯 Prerequisites

Before you begin, ensure you have met the following requirements:

- **Flutter SDK:** [Install Flutter](https://flutter.dev/docs/get-started/install) on your machine.
- **Dart SDK:** Comes bundled with Flutter.
- **IDE:** Visual Studio Code, Android Studio, or any other preferred IDE.
- **Device/Emulator:** A physical device or emulator to run the app.

### 🔧 Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/mood_tracker_app.git
   cd mood_tracker_app

2. **Install Dependencies
   
  - Ensure you have Flutter installed. Then, run:
    ```bash
    flutter pub get
3.	Generate Code
   
  - The project uses build_runner for code generation with Hive and Freezed. Generate the necessary files by running:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
  - Note: If you encounter any errors during code generation, ensure that your model annotations are correct and that       all necessary dependencies are included.
    
4.	Set Up Hive Adapters
  - Hive requires adapters for custom data types. Ensure that adapters are registered in main.dart before running the 
     app.

    ```bash
    // lib/main.dart
    
    import 'package:hive_flutter/hive_flutter.dart';
    import 'data/models/mood_model.dart';
    import 'data/models/wearable_data_model.dart';
    
    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
    
      // Initialize Hive
      await Hive.initFlutter();
    
      // Register the adapters
      Hive.registerAdapter(MoodModelAdapter());
      Hive.registerAdapter(WearableDataModelAdapter());
    
      // Open the boxes
      await Hive.openBox<MoodModel>('moodsBox');
      await Hive.openBox<WearableDataModel>('wearableBox');
    
      runApp(const MyApp());
    }

5.	Configure Assets
 - Ensure that the assets directory contains the necessary JSON files:
    	•	assets/fake_moods.json
    	•	assets/motivational_messages.json
    	•	assets/wearable_data.json
    The pubspec.yaml is already configured to include these assets.

    ```bash
     flutter:
      assets:
        - assets/fake_moods.json
        - assets/motivational_messages.json
        - assets/wearable_data.json
6.	Run the App
  - Connect your device or start an emulator, then execute:
    
    ```bash
    flutter run
    
  Troubleshooting:
  	•	No Devices Found: Ensure your emulator is running or your device is connected properly.
  	•	Dependency Issues: Run flutter pub get to fetch all dependencies.
  	•	Code Generation Errors: Verify model annotations and run flutter pub run build_runner build --delete- 
      conflicting-     outputs again.



### 📁 Project Structure

   - Here’s an overview of the project’s directory structure:
     ```bash
      mood_tracker_app/
      ├── assets/
      │   ├── fake_moods.json
      │   ├── motivational_messages.json
      │   └── wearable_data.json
      ├── lib/
      │   ├── data/
      │   │   ├── models/
      │   │   │   ├── mood_model.dart
      │   │   │   └── wearable_data_model.dart
      │   │   └── repositories/
      │   │       ├── mood_repository.dart
      │   │       └── wearable_repository.dart
      │   ├── logic/
      │   │   ├── cubits/
      │   │   │   ├── dashboard_cubit/
      │   │   │   │   ├── dashboard_cubit.dart
      │   │   │   │   └── dashboard_state.dart
      │   │   │   └── wearable_cubit/
      │   │   │       ├── wearable_cubit.dart
      │   │   │       └── wearable_state.dart
      │   ├── presentation/
      │   │   └── dashboard/
      │   │       ├── dashboard_screen.dart
      │   │       └── add_mood_sheet.dart
      │   ├── utils/
      │   │   └── models/
      │   │       └── result.dart
      │   └── main.dart
      ├── pubspec.yaml
      └── README.md



### 🧰 Technologies Used

  •	Flutter: UI toolkit for building natively compiled applications.
  •	Dart: Programming language optimized for UI.
  •	Hive: Lightweight and fast key-value database for Flutter.
  •	Bloc/Cubit: State management library.
  •	Freezed: Code generator for immutable classes and unions.
  •	Fl_Chart: Library for beautiful and customizable charts.
  •	JSON: For storing and loading data.


### 📚 How It Works

### 📦 Data Persistence with Hive

  The app uses Hive to store data locally, ensuring quick access and offline capabilities. There are two primary Hive 
   boxes:
  	1.	moodsBox: Stores mood entries mapped by Hive keys.
  	2.	wearableBox: Stores the latest wearable data.

### 🗃️ State Management with Bloc/Cubit

  The app leverages the Bloc pattern with Cubits to manage state efficiently. There are two main Cubits:
  	1.	DashboardCubit: Manages mood data, including loading, adding, and updating moods.
  	2.	WearableCubit: Manages wearable data, handling loading and updating steps and heart rate.

  Both Cubits utilize the Result class to represent different states (empty, loading, success, failure), ensuring a 
  clear and consistent state management approach.

### 📝 Journal Functionality

  Users can create journal entries tied to their moods. Each entry captures the user’s thoughts, mood, and the date, 
  providing a comprehensive overview of their emotional journey.

### 🏃‍♂️ Wearable Data Integration

  The app reads data from wearable_data.json to display steps and heart rate. This data is fetched and displayed on 
  the homepage, offering users insights into their physical activity alongside their emotional well-being.

🎉 Acknowledgements
	•	Flutter
	•	Bloc
	•	Hive
	•	Freezed
	•	Fl_Chart
	•	Readme Template
