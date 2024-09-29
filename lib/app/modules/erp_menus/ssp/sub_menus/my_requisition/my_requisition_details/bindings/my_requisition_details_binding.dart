import 'package:get/get.dart';

import '../controllers/my_requisition_details_controller.dart';

class MyRequisitionDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRequisitionDetailsController>(
      () => MyRequisitionDetailsController(),
    );
  }
}
