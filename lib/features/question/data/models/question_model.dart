class Question {
  final String id;
  final String name;
  final String status;
  final String example;

  Question({
    required this.id,
    required this.name,
    required this.status,
    required this.example,
  });

  // Convert a Question object to a Map for SQLite insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'example': example,
      'status': status,
    };
  }

  // Convert a Map (from SQLite query) to a Question object
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      example: map['example'] ?? '',
    );
  }
}
