class Task {
  final String id;
  final String userId;
  final String name;
  final bool isCompleted;
  final DateTime date;

  Task({
    required this.id,
    required this.userId,
    required this.name,
    this.isCompleted = false,
    required this.date,
  });

  factory Task.fromJson(Map<String, dynamic> json, {required DateTime date}) => Task(
        id: json['id'],
        userId: json['userId'],
        name: json['name'],
        isCompleted: json['isCompleted'],
        date: date,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'isCompleted': isCompleted,
      'date': date,
    };
  }
}
