import 'dart:async';

import 'package:get/get.dart';

import '../../../../data/login_creadential.dart';
import '../../../../routes/app_pages.dart';

class SplashController {
  LoginCredential loginCredential = LoginCredential();
  void navigate() async {
    Timer(const Duration(seconds: 3), () {
      if (loginCredential.isUserLoggedIn()) {
        Get.offNamed(Routes.HOME);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
  }
}
