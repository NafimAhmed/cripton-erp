import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../data/login_creadential.dart';
import '../../../../../../../../models/api_response.dart';
import '../../../../../../../../services/api_communication.dart';
import '../../../../../../../../utils/date_time.dart';
import '../../../../../../../../utils/network.dart';
import '../../../../../../../../utils/snackbar.dart';
import '../../../../../../../home/controllers/home_controller.dart';
import '../models/handober_person.dart';
import '../models/leave_category.dart';
import '../models/leave_type.dart';

class LeaveRequisitionController extends GetxController {
  late GlobalKey<FormState> leaveRequisitionFormKey;
  late TextEditingController handoverToController;
  late TextEditingController purposeController;
  late TextEditingController addressController;
  late TextEditingController phoneController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;
  late TextEditingController attachmentController;

  Rx<List<LeaveTypeModel>> leaveTypeList = Rx<List<LeaveTypeModel>>([]);
  Rx<List<LeaveCategoryModel>> leaveCategoryList =
      Rx<List<LeaveCategoryModel>>([]);
  Rx<LeaveTypeModel?> selectedLeaveType = Rx(null);
  Rx<LeaveCategoryModel?> selectedLeaveCategory = Rx(null);
  Rx<HandoberPersonModel?> selectedHandoberPerson = Rx(null);
  late ApiCommunication _apiCommunication;
  late LoginCredential credential;
  File? file;

  void onClickStartDateTextFormField(BuildContext context) async {
    final DateTime? dateTime = await showDatePickerDialog(context: context);
    if (dateTime != null) {
      startDateController.text = getFormatedDateInDBFormate(dateTime);
    }
  }

  void onClickEndDateTextFormField(BuildContext context) async {
    final DateTime? dateTime = await showDatePickerDialog(context: context);
    if (startDateController.text.isNotEmpty) {
      if (dateTime != null) {
        int value = compareDateString(
            start: startDateController.text,
            end: getFormatedDateInDBFormate(dateTime));
        if (value == 0 || value < 0) {
          endDateController.text = getFormatedDateInDBFormate(dateTime);
        } else {
          showErrorSnackkbar(
              message: "Leave End Date Can't Be Earlier Than Start Date");
        }
      }
    } else {
      showErrorSnackkbar(message: 'Select start date first');
    }
  }

  Future getLeaveType() async {
    ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Leave/GetLeaveTypes',
    );

    List data = response.data as List;
    leaveTypeList.value = data
        .map((element) =>
            LeaveTypeModel.fromMap(element as Map<String, dynamic>))
        .toList();
  }

  Future getLeaveCategory() async {
    ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Leave/GetLeaveCategory',
    );

    List data = response.data as List;
    leaveCategoryList.value = data
        .map((element) =>
            LeaveCategoryModel.fromMap(element as Map<String, dynamic>))
        .toList();
    if (leaveCategoryList.value.isNotEmpty) {
      selectedLeaveCategory.value = leaveCategoryList.value[0];
    }
  }

  Future<List<HandoberPersonModel>> getHandobertoPersonsList() async {
    ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Leave/GetResponsibleEmployees',
    );
    List<HandoberPersonModel> handoberToList = (response.data as List)
        .map((element) =>
            HandoberPersonModel.fromMap(element as Map<String, dynamic>))
        .toList();

    return handoberToList;
  }

  bool isValidLeaveRequisition() {
    if (leaveRequisitionFormKey.currentState!.validate()) {
      //TextFormField Validation
      if (stringToDateTime(startDateController.text) ==
              stringToDateTime(endDateController.text) ||
          stringToDateTime(startDateController.text)
              .isBefore(stringToDateTime(endDateController.text))) {
        //Date Time Validation

        if ((selectedLeaveType.value?.id ?? '').isNotEmpty) {
          //Leave Type Validation

          if ((selectedLeaveCategory.value?.value ?? '').isNotEmpty) {
            //Leave category Validation

            if ((selectedHandoberPerson.value?.id ?? '').isNotEmpty) {
              //Handober Person Validation

              return true;
            } else {
              //Handober Person Validation

              showWarningSnackkbar(message: 'Responsible employee is required');
              return false;
            }
          } else {
            //Leave category Validation

            showWarningSnackkbar(message: 'Leave category is required');
            return false;
          }
        } else {
          //Leave Type Validation

          showWarningSnackkbar(message: 'Leave type is required');
          return false;
        }
      } else {
        //Date Time Validation
        showWarningSnackkbar(
            message: 'Start date must be equal or less than end date');
        return false;
      }
    } else {
      //TextFormField Validation
      return false;
    }
  }

  submitleaveRequisition() async {
    if (isValidLeaveRequisition()) {
      Map<String, dynamic> inputData = {
        'AddressDuringLeave': addressController.text,
        'Reason': purposeController.text,
        'LeaveDurationFrom': startDateController.text,
        'LeaveDurationTo': endDateController.text,
        'ContactNumber': phoneController.text,
        'LeaveType': selectedLeaveType.value?.id,
        'LeaveCategory': 'Full',
        'ResponsibleEmployeeId': selectedHandoberPerson.value?.id,
      };

      ApiResponse response = await _apiCommunication.doPostRequest(
          apiEndPoint: 'Leave/SaveLeaveRequisition',
          responseDataKey: 'data',
          requestData: inputData,
          file: file,
          isFormData: true,
          showSuccessMessage: true,
          successMessage: 'Leave requisition submitted successfully');
      if (response.isSuccessful) {
        clearAllInputFieldData();
        refreshDashboardData();
        debugPrint('Successful');
      }
    }
  }

  void refreshDashboardData() {
    HomeController controller = Get.find();
    controller.getApprovalSummary();
  }

  void clearAllInputFieldData() {
    startDateController.text = '';
    endDateController.text = '';
    purposeController.text = '';
    addressController.text = '';
    phoneController.text = '';
    attachmentController.text = '';
    file = null;
    selectedLeaveType.value = null;
    selectedLeaveCategory.value = null;
    selectedHandoberPerson.value = null;
  }

  uploadLeaveAttachment() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'jpg', 'png', 'pdf'],
    );
    if (result != null) {
      //File selected
      file = File(result.files.single.path!);
      int fileSize = await file!.length();
      if (fileSize < 1000000) {
        attachmentController.text = getFileNameFromFile(file!);
      } else {
        showErrorSnackkbar(message: 'File size must be less than 1 MB');
        file = null;
      }
    } else {
      debugPrint('No file found');
    }
  }

  @override
  void onInit() async {
    super.onInit();
    _apiCommunication = ApiCommunication();
    credential = LoginCredential();
    leaveRequisitionFormKey = GlobalKey();
    handoverToController = TextEditingController();
    purposeController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    attachmentController = TextEditingController();
    await getLeaveType();
    await getLeaveCategory();
    phoneController.text = credential.getUserData().mobile ?? '';
  }

  @override
  void onClose() {
    super.onClose();
    _apiCommunication.endConnection();
    handoverToController.dispose();
    purposeController.dispose();
    addressController.dispose();
    phoneController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    attachmentController.dispose();
  }
}
