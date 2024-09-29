import 'package:get/get.dart';

import '../controllers/mnm_controller.dart';

class MNMBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MNMController>(
      () => MNMController(),
    );
  }
}
