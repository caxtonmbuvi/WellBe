// lib/data/models/journal_entry.dart
class JournalEntry {
  final String text;
  final DateTime date;
  final String mood;

  JournalEntry({
    required this.text,
    required this.date,
    required this.mood,
  });

  // Convert to/from Map if needed for Hive or JSON
}