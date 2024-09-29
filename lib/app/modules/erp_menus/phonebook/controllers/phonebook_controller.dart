import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/login_creadential.dart';
import '../../../../models/api_response.dart';
import '../../../../models/user.dart';
import '../../../../services/api_communication.dart';
import '../../../../utils/dialog.dart';
import '../models/contact.dart';

class PhonebookController extends GetxController {
  late final UserModel user;
  late LoginCredential credential;
  late ApiCommunication _apiCommunication;

  Rx<List<ContactModel>> contactList = Rx<List<ContactModel>>([]);

  onClickMessage(BuildContext context, String phoneNumber) {
    showQuestionDialog(
      question: 'Do you want to send message ?',
      onPressedYes: () {
        Get.back();
        Uri smsLaunchUri = Uri(
          scheme: 'sms',
          path: phoneNumber,
        );
        launchUrl(smsLaunchUri);
      },
    );
  }

  onClickCall(BuildContext context, String phoneNumber) {
    showQuestionDialog(
      question: 'Do you want to call ?',
      onPressedYes: () {
        Get.back();
        final Uri smsLaunchUri = Uri(
          scheme: 'tel',
          path: phoneNumber,
        );
        launchUrl(smsLaunchUri);
      },
    );
  }

  getContactList() async {
    final ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Employee/GetUserListAsync',
      requestData: {
        'departmentId': user.departmentId,
        'regionId': '',
        'searchWith': '',
        'hints': ''
      },
    );
    if (response.isSuccessful) {
      List data = response.data as List;
      contactList.value = data
          .map((element) =>
              ContactModel.fromJson(element as Map<String, dynamic>))
          .toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    credential = LoginCredential();
    user = credential.getUserData();
    _apiCommunication = ApiCommunication();
    getContactList();
  }

  @override
  void onClose() {
    super.onClose();
    _apiCommunication.endConnection();
  }
}
