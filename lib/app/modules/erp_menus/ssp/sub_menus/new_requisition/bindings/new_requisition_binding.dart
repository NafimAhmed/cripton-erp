import 'package:get/get.dart';

import '../controllers/new_requisition_controller.dart';

class NewRequisitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewRequisitionController>(
      () => NewRequisitionController(),
    );
  }
}
