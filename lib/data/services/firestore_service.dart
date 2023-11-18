import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/task.dart';
import '../models/user.dart';

class FirestoreService extends GetxService {
  static FirestoreService get to => Get.find();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  // Users
  Future<void> addUser(AppUser user) async {
    try {
      await users
          .doc(user.uid)
          .set(user.toJson())
          .then((value) => print("User added"))
          .catchError((error) => print(error));
    } catch (e) {
      print(e);
    }
  }

  // Tasks
  Future<void> getTasks() async {
    try {
      await users
          .get()
          .then((value) => print("Tasks fetched"))
          .catchError((error) => print(error));
    } catch (e) {
      print(e);
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await users
          .doc(task.userId)
          .collection('tasks')
          .doc(task.id)
          .set(task.toJson())
          .then((value) => print("Task added"))
          .catchError((error) => print(error));
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await users
          .doc(task.id)
          .collection('tasks')
          .doc(task.id)
          .update(task.toJson())
          .then((value) => print("Task updated"))
          .catchError((error) => print(error));
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await users
          .doc(task.id)
          .collection('tasks')
          .doc(task.id)
          .delete()
          .then((value) => print("Task deleted"))
          .catchError((error) => print(error));
    } catch (e) {
      print(e);
    }
  }
}
