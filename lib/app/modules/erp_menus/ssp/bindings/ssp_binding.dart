import 'package:get/get.dart';

import '../controllers/ssp_controller.dart';

class SspBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SspController>(
      () => SspController(),
    );
  }
}
