import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/task.dart';
import '../models/user.dart';

class FirestoreService extends GetxService {
  static FirestoreService get to => Get.find();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  // TODO: Add error handling here
  // FIXME: The snackbar doesn't appear 'cause the function Get.back() is called
  // Users
  Future<void> addUser(AppUser user) async {
    try {
      await users
          .doc(user.uid)
          .set(user.toJson())
          .then((value) => Get.snackbar("User created successfully", "OK"))
          .catchError((error) => print(error));
    } catch (e) {
      print(e);
    }
  }

  // Tasks
  Future<void> getTasks() async {
    try {
      await users.get().catchError((error) => print(error));
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
          .then((value) => Get.snackbar("Task created successfully", "OK"))
          .catchError((error) => print(error));
    } catch (e) {
      print(e);
    }
  }

  Future<void> completeTask(Task task) async {
    try {
      await users
          .doc(task.userId)
          .collection('tasks')
          .doc(task.id)
          .update(task.toJson())
          .then((value) => Get.snackbar("Task completed successfully", "OK"))
          .catchError((error) => print(error));
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await users
          .doc(task.userId)
          .collection('tasks')
          .doc(task.id)
          .delete()
          .then((value) => Get.snackbar("Task deleted successfully", "OK"))
          .catchError((error) => print(error));
    } catch (e) {
      print(e);
    }
  }
}
