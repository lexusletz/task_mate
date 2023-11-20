import 'package:get/get.dart';
import 'package:task_mate/data/services/storage_service.dart';

import '../constants/storage.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;

  String token = "";

  bool get isLogin => _isLogin.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    super.onInit();
  }

  setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_PROFILE_KEY, value);
  }

  getProfile() async {
    if (token.isEmpty) return "";
    return StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
  }

  // TODO: save profile
  saveProfile() {}

  // TODO: logout
}
