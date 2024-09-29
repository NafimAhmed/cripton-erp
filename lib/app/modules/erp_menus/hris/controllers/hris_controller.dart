import 'package:get/get.dart';

import '../../../../models/menu.dart';
import '../../../../utils/snackbar.dart';

class HrisController extends GetxController {
  void onClickHRISMenu({required MenuModel menuModel}) {
    if (menuModel.route != null) {
      Get.toNamed(menuModel.route!);
    } else {
      showWarningSnackkbar(message: '${menuModel.titile} is under development');
    }
  }
}
