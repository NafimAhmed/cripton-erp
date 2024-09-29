import 'package:get/get.dart';

import '../../../../../utils/snackbar.dart';

class MNMEnqueryStatusController extends GetxController {
  void onClickMNMMenue(String? route) {
    if (route != null) {
      Get.toNamed(route);
    } else {
      showWarningSnackkbar(
          titile: 'Upcomming!', message: 'This menu is under development.');
    }
  }
}
