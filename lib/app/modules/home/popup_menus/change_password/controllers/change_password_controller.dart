import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/api_response.dart';
import '../../../../../services/api_communication.dart';
import '../../../../../utils/snackbar.dart';

class ChangePasswordController extends GetxController {
  late ApiCommunication _apiCommunication;

  final GlobalKey<FormState> changePasswordFormKey = GlobalKey();
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late FocusNode currentPasswordFocusNode;
  late FocusNode newPasswordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  Rx<bool> currentObscureText = true.obs;
  Rx<bool> newObscureText = true.obs;
  Rx<bool> confirmObscureText = true.obs;

  bool isValidForChangePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) {
    if (changePasswordFormKey.currentState!.validate()) {
      if (newPassword == confirmPassword) {
        return true;
      } else {
        showWarningSnackkbar(message: 'Password not matched');
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> changePassword() async {
    String currentPassword = currentPasswordController.text.trim();
    String newPassword = newPasswordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (isValidForChangePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    )) {
      Map<String, dynamic> inputData = {
        'oldPassword': currentPasswordController.text.trim(),
        'newPassword': newPasswordController.text.trim()
      };

      ApiResponse apiResponse = await _apiCommunication.doPostRequest(
        apiEndPoint: 'Accounts/AcChangePassword',
        responseDataKey: 'data',
        requestData: inputData,
        isFormData: false,
        showSuccessMessage: true,
      );
      if (apiResponse.isSuccessful) {
        clearTextfields();
        Get.back();
      }
    }
  }

  clearTextfields() {
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    _apiCommunication = ApiCommunication();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    currentPasswordFocusNode = FocusNode();
    newPasswordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  void onClose() {
    super.onClose();
    _apiCommunication.endConnection();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    currentPasswordFocusNode.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }
}
