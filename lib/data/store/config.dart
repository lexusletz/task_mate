import 'package:get/get.dart';

import '../constants/storage.dart';
import '../services/storage_service.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  bool isFirstOpen = false;

  @override
  void onInit() async {
    isFirstOpen = StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
    super.onInit();
  }

  Future<bool> saveAlreadyOpen() async {
    return await StorageService.to.setBool(
      STORAGE_DEVICE_FIRST_OPEN_KEY,
      true,
    );
  }
}
