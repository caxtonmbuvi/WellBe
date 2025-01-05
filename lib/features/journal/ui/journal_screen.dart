// lib/presentation/journal/journal_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/features/journal/cubit/journal_cubit.dart';
import 'package:interview_app/features/journal/cubit/journal_state.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  JournalScreenState createState() => JournalScreenState();
}

class JournalScreenState extends State<JournalScreen> {
  final TextEditingController _controller = TextEditingController();
  String _selectedMood = "😊";

  @override
  void initState() {
    super.initState();
    context.read<JournalCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JournalCubit, JournalState>(
      builder: (context, state) {
        final result = state.journalResult;

        // 1. If loading or empty, show a loading spinner
        if (result.isLoading || result is! dynamic && !result.failed && !result.succeeded) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 2. If failed, show an error
        if (result.failed) {
          final errorMsg = result.failureMessage ?? "Unknown error";
          return Scaffold(
            body: Center(child: Text("Error: $errorMsg")),
          );
        }

        // 3. If succeeded, show the data
        if (result.succeeded) {
          final data = result.maybeMap(
            success: (success) => success.result,
            orElse: () => null,
          );
          if (data == null) {
            return const Scaffold(
              body: Center(child: Text("Error: no data available")),
            );
          }

          return Scaffold(
            appBar: AppBar(title: const Text("Journal")),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("Motivational Message: ${data.motivationalMessage}"),
                  const SizedBox(height: 8),
                  Text("Today's Steps: ${data.steps}"),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Write your journal...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 8),
                  // Simple mood selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _moodIcon("😊"),
                      const SizedBox(width: 10),
                      _moodIcon("😢"),
                      const SizedBox(width: 10),
                      _moodIcon("😡"),
                      const SizedBox(width: 10),
                      _moodIcon("😌"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      await context
                          .read<JournalCubit>()
                          .saveJournalEntry(_controller.text, _selectedMood);
                      _controller.clear();
                    },
                    child: const Text("Save Entry"),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.entries.length,
                    itemBuilder: (context, index) {
                      final entry = data.entries[index];
                      return ListTile(
                        title: Text(entry.text),
                        subtitle:
                            Text("${entry.mood} • ${entry.date.toLocal()}"),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        }

        // Default fallback
        return const SizedBox.shrink();
      },
    );
  }

  Widget _moodIcon(String mood) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMood = mood;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: _selectedMood == mood ? Colors.blueAccent : Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: Text(mood, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}