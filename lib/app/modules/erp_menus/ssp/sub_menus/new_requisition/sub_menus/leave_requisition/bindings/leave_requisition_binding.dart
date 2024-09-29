import 'package:get/get.dart';

import '../controllers/leave_requisition_controller.dart';

class LeaveRequisitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveRequisitionController>(
      () => LeaveRequisitionController(),
    );
  }
}
