import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/services/auth_service.dart';
import '../../data/services/firestore_service.dart';
import '../../data/store/config.dart';
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
      await ConfigStore.to.saveAlreadyOpen();
    } on PlatformException catch (e) {
      print(e); // TODO: Show error message
    } catch (e) {
      print(e); // TODO: Show error message
    }
  }
}
