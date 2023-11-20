import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String userId;
  final String name;
  bool isCompleted;
  final DateTime date;

  Task({
    required this.id,
    required this.userId,
    required this.name,
    this.isCompleted = false,
    required this.date,
  });

  void updateTask(bool isComp) {
    isCompleted = isComp;
  }

  factory Task.fromFirestore(DocumentSnapshot<Map<String, dynamic>> document) {
    return Task(
      id: document.id,
      userId: document['userId'],
      name: document['name'],
      isCompleted: document['isCompleted'],
      date: (document['date'] as Timestamp).toDate(),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        userId: json['userId'],
        name: json['name'],
        isCompleted: json['isCompleted'],
        date: (json["date"] as Timestamp).toDate(),
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
