import 'package:get/get.dart';

import '../controller/tna_controller.dart';

class TNAHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TNAHomeController>(
      () => TNAHomeController(),
    );
  }
}
