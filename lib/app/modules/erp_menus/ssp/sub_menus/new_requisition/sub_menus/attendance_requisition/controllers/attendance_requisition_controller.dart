import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../models/api_response.dart';
import '../../../../../../../../services/api_communication.dart';
import '../../../../../../../../utils/date_time.dart';

class AttendanceRequisitionController extends GetxController {
  late ApiCommunication _apiCommunication;

  Map<String, dynamic>? apiManualAttendanceMap;
  late final GlobalKey<FormState> attendanceReqisitionFormKey;
  late final TextEditingController attendanceDateController;
  late final TextEditingController inTimeContoller;
  late final TextEditingController outTimeContoller;
  late final TextEditingController reasonContoller;

  void onClickDateTextFormField(BuildContext context) async {
    DateTime currentDateTime = DateTime.now();
    final DateTime? dateTime = await showDatePickerDialog(
      context: context,
      firstDate: DateTime(currentDateTime.year, currentDateTime.month, 1),
      lastDate: DateTime(currentDateTime.year, currentDateTime.month + 1, 0),
    );

    if (dateTime != null) {
      attendanceDateController.text = getFormatedDateInDBFormate(dateTime);
    }
  }

  onClickInTimeTextFormField(BuildContext context) async {
    TimeOfDay? inTime = await showTimePickerDialogIn24HourFormate(context);
    if (inTime != null) {
      inTimeContoller.text = getFormatedTimeFromTimeOfDayInDBFormate(inTime);
    }
  }

  onClickOutTimeTextFormField(BuildContext context) async {
    TimeOfDay? outTime = await showTimePickerDialogIn24HourFormate(context);
    if (outTime != null) {
      outTimeContoller.text = getFormatedTimeFromTimeOfDayInDBFormate(outTime);
    }
  }

  submitAttendanceRequisition() async {
    if (attendanceReqisitionFormKey.currentState!.validate()) {
      Map<String, dynamic> inputData = {
        'attendanceDate': attendanceDateController.text,
        'inTime': inTimeContoller.text,
        'outTime': outTimeContoller.text,
        'inLatitude': null,
        'inLongitude': null,
        'outLatitude': null,
        'outLongitude': null,
        'inLocation': null,
        'outLocation': null,
        'comment': reasonContoller.text
      };

      ApiResponse apiResponse = await _apiCommunication.doPostRequest(
        apiEndPoint: 'Attendance/SubmitManualAttendance',
        responseDataKey: 'data',
        requestData: inputData,
        isFormData: false,
        showSuccessMessage: true,
      );
      if (apiResponse.isSuccessful) {
        attendanceDateController.clear();
        inTimeContoller.clear();
        outTimeContoller.clear();
        reasonContoller.clear();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    _apiCommunication = ApiCommunication();
    attendanceReqisitionFormKey = GlobalKey();
    attendanceDateController = TextEditingController();
    inTimeContoller = TextEditingController();
    outTimeContoller = TextEditingController();
    reasonContoller = TextEditingController();
  }

  @override
  void onClose() {
    _apiCommunication.endConnection();
    attendanceDateController.dispose();
    inTimeContoller.dispose();
    outTimeContoller.dispose();
    reasonContoller.dispose();
    super.onClose();
  }
}
