import 'package:get/get.dart';

import '../controllers/attendance_submission_controller.dart';

class AttendanceSubmissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceSubmissionController>(
      () => AttendanceSubmissionController(),
    );
  }
}
