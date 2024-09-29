import 'package:get/get.dart';

import '../controllers/api_config_controller.dart';

class ApiConfigBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiConfigController>(
      () => ApiConfigController(),
    );
  }
}
