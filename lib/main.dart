import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/services/auth_service.dart';
import 'data/services/firestore_service.dart';
import 'firebase_options.dart';
import 'presentation/constants/colors.dart';
import 'presentation/controllers/welcome_controller.dart';
import 'presentation/routes/app_routes.dart';
import 'presentation/routes/routes_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.lazyPut(() => WelcomeController());
  Get.lazyPut(() => AuthService());
  Get.lazyPut(() => FirestoreService());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
      theme: AppTheme.lightTheme,
      initialRoute: RoutesNames.WELCOME_ROUTE,
    );
  }
}
