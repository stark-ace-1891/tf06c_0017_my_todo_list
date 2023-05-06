class Task {
  final String id;
  final String title;
  final String date;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.date,
    this.isDone = false,
  });

  String get titleInCaps => title.toUpperCase();
}
