import 'package:get/get.dart';

import '../controllers/ict_service_requisition_controller.dart';

class IctServiceRequisitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IctServiceRequisitionController>(
      () => IctServiceRequisitionController(),
    );
  }
}
