class Task {
  final String text;
  final DateTime createdAt;

  Task({required this.text, DateTime? createdAt})
    : createdAt = createdAt ?? DateTime.now();
}
