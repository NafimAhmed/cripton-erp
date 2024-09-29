import 'package:get/get.dart';

import '../controllers/mnm_inquery_controllers.dart';

class MNMInqueryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MNMInqueryController>(
      () => MNMInqueryController(),
    );
  }
}
