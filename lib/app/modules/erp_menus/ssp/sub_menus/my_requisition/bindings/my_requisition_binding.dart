import 'package:get/get.dart';

import '../controllers/my_requisition_controller.dart';

class MyRequisitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRequisitionController>(
      () => MyRequisitionController(),
    );
  }
}
