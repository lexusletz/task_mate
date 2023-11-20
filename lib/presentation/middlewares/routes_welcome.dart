import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/store/config.dart';
import '../routes/routes_names.dart';

class RoutesMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RoutesMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (ConfigStore.to.isFirstOpen == true) {
      return const RouteSettings(name: RoutesNames.HOME_ROUTE);
    }
    return null;
  }
}
