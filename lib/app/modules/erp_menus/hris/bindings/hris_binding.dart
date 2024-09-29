import 'package:get/get.dart';

import '../controllers/hris_controller.dart';

class HrisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HrisController>(
      () => HrisController(),
    );
  }
}
