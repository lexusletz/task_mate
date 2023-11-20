import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/task.dart';
import '../../data/services/auth_service.dart';
import '../../data/services/firestore_service.dart';

class HomeController extends GetxController {
  static AuthService authService = Get.find();
  static FirestoreService firestoreService = Get.find();

  String uid = authService.getCurrentUser().uid;
  String username = authService.getCurrentUser().name;
  String photoUrl = authService.getCurrentUser().photoUrl;

  final Rx<TextEditingController> taskController = TextEditingController().obs;

  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  Stream<QuerySnapshot> getAllTasks() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('tasks')
        .snapshots();
  }

  Stream<QuerySnapshot> getTodayTasks() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('tasks')
        .where(
          "date",
          isEqualTo: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
        )
        .where("isCompleted", isNotEqualTo: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getCompletedTasks() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('tasks')
        .where("isCompleted", isEqualTo: true)
        .snapshots();
  }

  void addTask() async {
    try {
      await firestoreService.addTask(
        Task(
          id: const Uuid().v4(),
          userId: uid,
          name: taskController.value.text,
          isCompleted: false,
          date: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
        ),
      );
      taskController.value.text = "";
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  void deleteTask(Task task) async {
    try {
      await firestoreService.deleteTask(task);
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  void completeTask(Task task) async {
    try {
      await firestoreService.completeTask(task);
      Get.back();
    } catch (e) {
      print(e);
    }
  }
}
