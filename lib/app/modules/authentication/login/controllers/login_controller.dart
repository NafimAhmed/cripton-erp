import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/api_constant.dart';
import '../../../../data/login_creadential.dart';
import '../../../../data/server_credential.dart';
import '../../../../models/api_response.dart';
import '../../../../models/user.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_communication.dart';

class LoginController extends GetxController {
  late final TextEditingController userIdController;
  late final TextEditingController passwordController;
  Rx<bool> obscureText = true.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey();

  late ApiCommunication _apiCommunication;
  late LoginCredential _loginCredential;
  late ServerCredential _serverCredential;

  void onPressedLogin() async {
    String userId = userIdController.text;
    String password = passwordController.text;
    if (loginFormKey.currentState!.validate()) {
      final ApiResponse response = await _apiCommunication.doPostRequest(
        apiEndPoint: 'accounts/login/',
        requestData: {
          'userId': userId,
          'userPassword': password,
        },
        isFormData: true,
        responseDataKey: ApiConstant.FULL_RESPONSE,
        showSuccessMessage: true,
        addUserData: false,
        successMessage: 'You are successfully logged in',
      );
      if (response.isSuccessful) {
        Map<String, dynamic> fullResponse =
            response.data as Map<String, dynamic>;
        debugPrint(fullResponse.toString());
        UserModel user = UserModel.fromMap(
            fullResponse['user']); //Retrieving User data from Login Response
        _loginCredential.saveUserData(user);
        String token =
            fullResponse['token']; //Retrieving auth token from Login Response
        _loginCredential.saveToken(token);
        _loginCredential.changeUserAuthState(true);
        if (user.hasMultipleRegionAccess ?? false) {
          Get.offAllNamed(Routes.COMPANY);
        } else {
          Get.offAllNamed(Routes.HOME);
        }
      }
    }
  }

  bool havingServerCredential() {
    String? ipPort = _serverCredential.getIpPortData();
    if (ipPort == null) {
      return false;
    } else {
      return true;
    }
  }

  onClickSetting() {
    Get.toNamed(Routes.API_CONFIG);
  }

  @override
  void onInit() {
    super.onInit();
    userIdController = TextEditingController();
    passwordController = TextEditingController();
    _apiCommunication = ApiCommunication();
    _loginCredential = LoginCredential();
    _serverCredential = ServerCredential();
  }

  @override
  void onClose() {
    super.onClose();
    userIdController.dispose();
    passwordController.dispose();
    _apiCommunication.endConnection();
  }
}
