import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/button.dart';
import '../../../../../../../../components/text_form_field.dart';
import '../../../../../../../../models/menu.dart';
import '../controllers/attendance_requisition_controller.dart';

class AttendanceRequisitionView
    extends GetView<AttendanceRequisitionController> {
  const AttendanceRequisitionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Current Route Menu
    MenuModel? menuModel = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(menuModel?.titile ?? 'Attendance Requisition'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: controller.attendanceReqisitionFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClickableTextFormField(
                      onIconTap: () async {
                        controller.onClickDateTextFormField(context);
                      },
                      label: 'Date',
                      suffixIcon: Icons.calendar_month,
                      suffixIconColor: Colors.indigo,
                      controller: controller.attendanceDateController,
                      validationText: 'This field is required',
                    ),
                    const SizedBox(height: 10),
                    ClickableTextFormField(
                      onIconTap: () {
                        controller.onClickInTimeTextFormField(context);
                      },
                      suffixIcon: Icons.punch_clock,
                      suffixIconColor: Colors.indigo,
                      label: 'In time',
                      controller: controller.inTimeContoller,
                      validationText: 'This field is required',
                    ),
                    const SizedBox(height: 10),
                    ClickableTextFormField(
                      onIconTap: () {
                        controller.onClickOutTimeTextFormField(context);
                      },
                      suffixIcon: Icons.punch_clock,
                      suffixIconColor: Colors.indigo,
                      label: 'Out time',
                      controller: controller.outTimeContoller,
                      validationText: 'This field is required',
                    ),
                    const SizedBox(height: 10),
                    SecondaryTextFormField(
                      label: 'Reason',
                      maxLines: 4,
                      controller: controller.reasonContoller,
                      validationText: 'This field is required',
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                onPressed: () {
                  controller.submitAttendanceRequisition();
                  FocusScope.of(context).unfocus();
                },
                text: 'SUBMIT',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
