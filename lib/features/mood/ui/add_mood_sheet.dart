import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:interview_app/features/mood/model/mood_model.dart';
import 'package:interview_app/utils/widgets/custom_button.dart';
import 'package:intl/intl.dart';

class AddMoodSheet extends StatefulWidget {
  const AddMoodSheet({super.key});

  @override
  AddMoodSheetState createState() => AddMoodSheetState();
}

class AddMoodSheetState extends State<AddMoodSheet> {
  String _selectedMood = "😊";
  final TextEditingController _messageCtrl = TextEditingController();

  @override
  void dispose() {
    _messageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Access the current state to determine if a mood exists for today
    final dashboardState = context.watch<DashboardCubit>().state;
    final moods = dashboardState.moods;

    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);
    final existingMoodEntry = moods.entries.firstWhere(
      (entry) => _isSameDay(entry.value.date, today),
      orElse: () =>
          MapEntry(-1, MoodModel(date: today, mood: "😊", message: "")),
    );

    final existingMood =
        existingMoodEntry.key != -1 ? existingMoodEntry.value : null;

    // Convert moods Map to List and sort by date descending
    final List<MoodModel> moodList = moods.values.toList()
      ..sort((a, b) => b.date.compareTo(a.date));

    return SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets, // Handle keyboard overlap
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                existingMood != null
                    ? "Update Your Mood Today"
                    : "How are you feeling today?",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildMoodRow(),
              const SizedBox(height: 16),
              TextField(
                controller: _messageCtrl,
                decoration: const InputDecoration(
                  labelText: "Add a message about your day/mood",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomButton(
                  onTap: () {
                    final message = _messageCtrl.text.trim();
                    if (message.isEmpty) {
                      // Show a validation message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please enter a message.")),
                      );
                      return;
                    }
                    context.read<DashboardCubit>().addOrUpdateMood(
                          mood: _selectedMood,
                          message: message,
                        );
                    Navigator.pop(context); // Close the sheet
                  },
                  text: existingMood != null ? "Update Mood" : "Save Mood"),
              const SizedBox(height: 16),
              const Text(
                "Previously Added Moods:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200, // Adjust height as needed
                child: moodList.isEmpty
                    ? const Center(child: Text("No moods added yet."))
                    : ListView.builder(
                        itemCount: moodList.length,
                        itemBuilder: (context, index) {
                          final moodObj = moodList[index];
                          final formattedDate =
                              DateFormat('dd MMM yyyy, hh:mm a')
                                  .format(moodObj.date);
                          return ListTile(
                            leading: Text(
                              moodObj.mood,
                              style: const TextStyle(fontSize: 24),
                            ),
                            title: Text(moodObj.message),
                            subtitle: Text(formattedDate),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Checks if two dates are on the same day.
  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  /// Builds the row of selectable mood emojis.
  Widget _buildMoodRow() {
    final availableMoods = ["😊", "😌", "😢", "😡"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: availableMoods.map((m) {
        final bool isSelected = (m == _selectedMood);
        return GestureDetector(
          onTap: () => setState(() => _selectedMood = m),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.blueAccent : Colors.grey[200],
            ),
            padding: const EdgeInsets.all(12),
            child: Text(
              m,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        );
      }).toList(),
    );
  }
}
