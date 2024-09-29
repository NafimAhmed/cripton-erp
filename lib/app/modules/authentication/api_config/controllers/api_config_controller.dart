import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/server_credential.dart';
import '../../../../models/api_response.dart';
import '../../../../services/api_communication.dart';

class ApiConfigController extends GetxController {
  late final GlobalKey<FormState> ipPortConfigKey;
  late final TextEditingController ipPortController;
  late final TextEditingController imageServerPathController;
  late ServerCredential _serverCredential;
  late ApiCommunication _apiCommunication;

  void onClickSave() async {
    if (ipPortConfigKey.currentState!.validate()) {
      String serverStartPoint = ipPortController.text;
      String imageServerPath = imageServerPathController.text;
      await _serverCredential.saveIpPortData(serverStartPoint);
      await _serverCredential.saveIpImagePath(imageServerPath);
      await saveImageServerPath(imageServerPath: imageServerPath);
      Get.back();
    }
  }

  Future<bool> saveImageServerPath({required imageServerPath}) async {
    ApiResponse apiResponse = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Setting/UpdateDirectory',
      addUserData: false,
      requestData: {
        'directoryPath': imageServerPath,
      },
    );
    if (apiResponse.isSuccessful) {
      return true;
    } else {
      return false;
    }
  }

  String? getPreviousIpPort() {
    return _serverCredential.getIpPortData();
  }

  String? getPreviousImagePath() {
    return _serverCredential.getImagePathData();
  }

  @override
  void onInit() {
    super.onInit();
    ipPortController = TextEditingController();
    imageServerPathController = TextEditingController();
    _serverCredential = ServerCredential();
    ipPortConfigKey = GlobalKey<FormState>();
    ipPortController.text = getPreviousIpPort() ?? '';
    imageServerPathController.text = getPreviousImagePath() ?? '';
    _apiCommunication = ApiCommunication();
  }

  @override
  void onClose() {
    super.onClose();
    ipPortController.dispose();
    imageServerPathController.dispose();
    _apiCommunication.endConnection();
  }
}
