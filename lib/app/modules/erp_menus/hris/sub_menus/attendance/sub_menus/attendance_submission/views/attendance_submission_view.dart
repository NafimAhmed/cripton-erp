import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/circular_progress_button.dart';
import '../controllers/attendance_submission_controller.dart';

class AttendanceSubmissionView extends GetView<AttendanceSubmissionController> {
  const AttendanceSubmissionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Submission'),
        centerTitle: true,
      ),
      body: Obx(
        () => Center(
          child: CircularProgressButton(
            fontSize: 24,
            textColor: controller.attendanceButtonTextColor.value,
            backgroundColor: controller.attendanceButtonBackgroundColor.value,
            text: controller.attendanceButtonText.value,
            onProgressSuccess: () {
              controller.submitAttendanceRequisition();
            },
          ),
        ),
      ),
    );
  }
}
