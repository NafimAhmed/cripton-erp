import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/date_time.dart';
import '../../../../../utils/snackbar.dart';

class MNMInqueryController extends GetxController {
  TextEditingController fromdateController = TextEditingController();
  TextEditingController todateController = TextEditingController();

  void onClickFromDateTextFormField(BuildContext context) async {
    final DateTime? dateTime = await showDatePickerDialog(context: context);
    if (dateTime != null) {
      fromdateController.text = getFormatedDateInDBFormate(dateTime);
    }
  }

  void onClickToDateTextFormField(BuildContext context) async {
    final DateTime? dateTime = await showDatePickerDialog(context: context);
    if (dateTime != null) {
      todateController.text = getFormatedDateInDBFormate(dateTime);
    }
  }

  void onClickMNMMenue(String? route) {
    if (route != null) {
      Get.toNamed(route);
    } else {
      showWarningSnackkbar(
          titile: 'Upcomming!', message: 'This menu is under development.');
    }
  }
}
