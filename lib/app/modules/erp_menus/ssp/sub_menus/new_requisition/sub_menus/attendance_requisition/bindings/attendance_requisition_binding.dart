import 'package:get/get.dart';

import '../controllers/attendance_requisition_controller.dart';

class AttendanceRequisitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceRequisitionController>(
      () => AttendanceRequisitionController(),
    );
  }
}
