import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../config/api_constant.dart';
import '../../../../../../data/login_creadential.dart';
import '../../../../../../models/api_response.dart';
import '../../../../../../models/user.dart';
import '../../../../../../services/api_communication.dart';
import '../../../../../../utils/image.dart';
import '../../../../../../utils/snackbar.dart';
import '../model/employee.dart';

class ProfilePicAndSignatureController extends GetxController {
  late final UserModel user;
  late LoginCredential credential;
  late ApiCommunication _apiCommunication;
  Rx<EmployeeModel?> employee = Rx<EmployeeModel?>(null);
  //Field
  late TextEditingController employeeIdController;

  void getEmployeeData() async {
    String employeeId = employeeIdController.text.trim();
    employee.value = null;
    if (employeeId.isNotEmpty) {
      // Having employee Id
      final ApiResponse response = await _apiCommunication.doPostRequest(
        apiEndPoint: 'Employee/GetUserListAsync',
        requestData: {
          'searchWith': 'EmpCode',
          'hints': employeeId,
        },
        responseDataKey: ApiConstant.DATA_RESPONSE,
      );
      if (response.isSuccessful) {
        List listResponse = response.data as List;
        List<EmployeeModel> employeeList = listResponse
            .map((employee) =>
                EmployeeModel.fromMap(employee as Map<String, dynamic>))
            .toList();
        if (employeeList.isNotEmpty) {
          EmployeeModel employeeModel = employeeList.first;
          employee.value = employeeModel;
          employee.refresh();
        }
      }
    } else {
      showErrorSnackkbar(message: 'Employee id is required');
    }
  }

  Future<void> uploadFile({
    required File file,
    required String pictureType,
  }) async {
    debugPrint(
        'File Size:--------------------------${file.lengthSync()}--------------------------');
    if (file.lengthSync() > 0 && file.lengthSync() < 1000001) {
      final ApiResponse response = await _apiCommunication.doPostRequest(
        apiEndPoint: 'Employee/UploadEmployeePic',
        requestData: {
          'PictureType': pictureType,
          'EmployeeCode': '${employee.value?.id}',
        },
        file: file,
        fileKey: 'Picture',
        isFormData: true,
        showSuccessMessage: true,
      );
      if (response.isSuccessful) {
        getEmployeeData();
      }
    } else {
      showErrorSnackkbar(message: 'File size must be within 1Mb.');
    }
  }

  Future<void> onClickChangePhoto() async {
    if (employee.value != null) {
      File? file = await pickImage();
      if (file != null) {
        File? croppedFile = await cropImage(file);
        if (croppedFile != null) {
          uploadFile(file: croppedFile, pictureType: 'UserPic');
        } else {
          uploadFile(file: file, pictureType: 'UserPic');
        }
      }
      debugPrint(file?.path ?? '');
    } else {
      showWarningSnackkbar(message: 'Search a employee to change his photo.');
    }
  }

  Future<void> onClickChangeSignature() async {
    if (employee.value != null) {
      File? file = await pickImage();

      if (file != null) {
        File? croppedFile = await cropImage(file);
        if (croppedFile != null) {
          uploadFile(file: croppedFile, pictureType: 'UserSigneture');
        } else {
          uploadFile(file: file, pictureType: 'UserSigneture');
        }
      }
      debugPrint(file?.path ?? '');
    } else {
      showWarningSnackkbar(
          message: 'Search a employee to change his signature.');
    }
  }

  @override
  void onInit() {
    super.onInit();
    credential = LoginCredential();
    user = credential.getUserData();
    _apiCommunication = ApiCommunication();
    employeeIdController = TextEditingController();
  }

  @override
  void onReady() async {
    // getEmployeeData();
    super.onReady();
  }

  @override
  void onClose() {
    _apiCommunication.endConnection();
    employeeIdController.dispose();
    super.onClose();
  }
}
