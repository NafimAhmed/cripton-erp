import 'package:get/get.dart';

import '../controllers/general_store_requisition_controller.dart';

class GeneralStoreRequisitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeneralStoreRequisitionController>(
      () => GeneralStoreRequisitionController(),
    );
  }
}
