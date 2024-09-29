import 'package:get/get.dart';

import '../controllers/ict_store_requisition_controller.dart';

class IctStoreRequisitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IctStoreRequisitionController>(
      () => IctStoreRequisitionController(),
    );
  }
}
