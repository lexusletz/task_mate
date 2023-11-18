import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_mate/data/services/firestore_service.dart';

import '../../data/services/auth_service.dart';
import '../routes/routes_names.dart';


class WelcomeController extends GetxController {
  static AuthService authService = Get.find();
  static FirestoreService firestoreService = Get.find();

  void signIn() async {
    try {
      await authService.signInWithGoogle();
      final user = authService.getCurrentUser();
      await firestoreService.addUser(user);
      Get.offAllNamed(RoutesNames.HOME_ROUTE);
    } on PlatformException catch (e) {
      print(e); // TODO: Show error message
    } catch (e) {
      print(e); // TODO: Show error message
    }
  }
}
