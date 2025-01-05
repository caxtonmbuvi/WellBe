// lib/presentation/dashboard/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:interview_app/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:interview_app/features/dashboard/cubit/dashboard_state.dart';
import 'package:interview_app/features/mood/model/mood_model.dart';
import 'package:interview_app/features/mood/ui/add_mood_sheet.dart';
import 'package:interview_app/features/wearable/cubit/wearable_cubit.dart';
import 'package:interview_app/features/wearable/cubit/wearable_state.dart';
import 'package:interview_app/features/wearable/model/wearable_data_model.dart';
import 'package:intl/intl.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Load existing moods and wearable data when the screen initializes
    context.read<DashboardCubit>().loadMoods();
    context.read<WearableCubit>().loadWearableData();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DashboardCubit, DashboardState>(
          listenWhen: (previous, current) => previous.moodStatus != current.moodStatus,
          listener: (context, state) {
            // If a new mood was successfully added, show the new quote in a SnackBar
            if (state.moodStatus.succeeded && state.newQuote.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Motivational Message: ${state.newQuote}")),
              );
            }
            // If there's an error
            if (state.moodStatus.failed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: ${state.moodStatus.failureMessage}")),
              );
            }
          },
        ),
        BlocListener<WearableCubit, WearableState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == WearableStatus.success && state.wearableData != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Wearable data loaded successfully.")),
              );
            }
            if (state.status == WearableStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error loading wearable data: ${state.errorMessage}")),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddMoodSheet(context),
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the most positive mood at the top
              BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  final mostPositiveMood = context.read<DashboardCubit>().getMostPositiveMood();
                  if (mostPositiveMood == null) return const SizedBox();
                  return Card(
                    color: Colors.lightBlueAccent.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            "Most Positive Mood: ",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            mostPositiveMood.mood,
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              mostPositiveMood.message,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Display Wearable Data
              BlocBuilder<WearableCubit, WearableState>(
                builder: (context, state) {
                  if (state.status == WearableStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.status == WearableStatus.failure) {
                    return Text(
                      "Failed to load wearable data: ${state.errorMessage}",
                      style: const TextStyle(color: Colors.red),
                    );
                  } else if (state.status == WearableStatus.success && state.wearableData != null) {
                    final WearableDataModel data = state.wearableData!;
                    final formattedDate = DateFormat('dd MMM yyyy, hh:mm a').format(data.lastUpdated.toLocal());

                    return Card(
                      color: Colors.greenAccent.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wearable Data",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.directions_walk, color: Colors.blue),
                                const SizedBox(width: 8),
                                Text("Steps: ${data.steps}"),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.favorite, color: Colors.red),
                                const SizedBox(width: 8),
                                Text("Heart Rate: ${data.heartRate} BPM"),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text("Last Updated: $formattedDate"),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),

              const SizedBox(height: 16),

              // Display Mood Bar Chart
              Text(
                "Your Mood Bar Chart",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  final moods = state.moods;

                  // Get the most positive mood
                  final mostPositiveMood = context.read<DashboardCubit>().getMostPositiveMood();

                  // Generate a list of the last 7 days including today
                  final today = DateTime.now();
                  final last7Days = List<DateTime>.generate(7, (index) {
                    return DateTime(today.year, today.month, today.day)
                        .subtract(Duration(days: 6 - index));
                  });

                  // Map each day to its MoodModel, if exists
                  final moodMap = <DateTime, MoodModel>{};
                  final moodKeyMap = <DateTime, int>{}; // To store Hive keys

                  moods.forEach((key, mood) {
                    final dateKey = DateTime(mood.date.year, mood.date.month, mood.date.day);
                    // Only keep one mood per day (latest)
                    moodMap[dateKey] = mood;
                    moodKeyMap[dateKey] = key;
                  });

                  // Prepare data for the bar chart
                  final barGroups = last7Days.asMap().entries.map((entry) {
                    final index = entry.key;
                    final date = entry.value;
                    final mood = moodMap[date];
                    final moodValue = mood != null ? _mapMoodToY(mood.mood) : 0.0;
                    final color = mood != null ? _mapMoodToColor(mood.mood) : Colors.grey[300]!;

                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: moodValue,
                          color: color,
                          width: 20,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ],
                    );
                  }).toList();

                  return SizedBox(
                    height: 300, // Adjust as needed
                    child: BarChart(
                      BarChartData(
                        minY: 0,
                        maxY: 5, // Adjust based on mood scale
                        barGroups: barGroups,
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              interval: 1, // Ensure only integer intervals
                              getTitlesWidget: (value, meta) =>
                                  _buildLeftEmojiTitle(value, meta),
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                if (value.toInt() < 0 || value.toInt() >= last7Days.length) {
                                  return const SizedBox();
                                }
                                final date = last7Days[value.toInt()];
                                final dayLabel = DateFormat('EEE').format(date); // e.g., "Mon"
                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  space: 4,
                                  child: Text(
                                    dayLabel,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                );
                              },
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        gridData: FlGridData(
                          show: true,
                          horizontalInterval: 1, // Ensure grid lines align with integer values
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Optionally, you can add additional widgets here
            ],
          ),
        ),
      ),
    );
  }

  /// Maps mood emojis to integer scale (1..4).
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

  /// Maps mood to bar color.
  Color _mapMoodToColor(String mood) {
    switch (mood) {
      case "😡":
        return Colors.red;
      case "😢":
        return Colors.blue;
      case "😌":
        return Colors.orange;
      case "😊":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  /// Returns an emoji for the left axis based on the integer scale (1..4).
  Widget _buildLeftEmojiTitle(double value, TitleMeta meta) {
    final intVal = value.toInt();
    String emoji;
    switch (intVal) {
      case 1:
        emoji = "😡"; // Angry
        break;
      case 2:
        emoji = "😢"; // Sad
        break;
      case 3:
        emoji = "😌"; // Calm
        break;
      case 4:
        emoji = "😊"; // Happy
        break;
      default:
        return const SizedBox(); // No label for 0 or 5
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(emoji, style: const TextStyle(fontSize: 16)),
    );
  }

  /// Displays the Add Mood bottom sheet.
  void _showAddMoodSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true, // Let it expand with content
      context: context,
      builder: (_) => const AddMoodSheet(),
    );
  }
}