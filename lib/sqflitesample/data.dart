class JournalEntry {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;

  JournalEntry({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory JournalEntry.fromMap(Map<String, dynamic> map) {
    return JournalEntry(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
