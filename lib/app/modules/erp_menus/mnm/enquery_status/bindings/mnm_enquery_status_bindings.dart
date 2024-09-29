import 'package:get/get.dart';

import '../controller/mnm_enquery_status_controller.dart';

class MNMEnqueryStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MNMEnqueryStatusController>(
      () => MNMEnqueryStatusController(),
    );
  }
}
