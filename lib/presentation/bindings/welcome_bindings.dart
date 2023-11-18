import 'package:get/get.dart';

import '../../data/services/auth_service.dart';
import '../../data/services/firestore_service.dart';
import '../controllers/welcome_controller.dart';

class WelcomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => FirestoreService());
  }
}
