import 'package:get/get.dart';

import '../bindings/home_bindings.dart';
import '../bindings/welcome_bindings.dart';
import '../middlewares/routes_welcome.dart';
import '../screens/home_screen.dart';
import '../screens/welcome_screen.dart';
import 'routes_names.dart';

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: RoutesNames.WELCOME_ROUTE,
      page: () => const WelcomeScreen(),
      binding: WelcomeBindings(),
      middlewares: [
        RoutesMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: RoutesNames.HOME_ROUTE,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
  ];
}
