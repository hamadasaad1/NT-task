class Tip {
  final String id;
  final String content; // The interview tip text
  final String? advancedStrategy; // Optional advanced strategy

  Tip({
    required this.id,
    required this.content,
    this.advancedStrategy,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'advancedStrategy': advancedStrategy,
    };
  }

  factory Tip.fromMap(Map<String, dynamic> map) {
    return Tip(
      id: map['id'],
      content: map['content'],
      advancedStrategy: map['advancedStrategy'],
    );
  }
}
