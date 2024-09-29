import 'package:get/get.dart';

import '../controller/tna_traffic_light_controller.dart';

class TNATrafficBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TNATrafficLightController>(
      () => TNATrafficLightController(),
    );
  }
}
