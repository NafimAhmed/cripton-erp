import 'package:get/get.dart';

import '../../../../models/menu.dart';

class SspController extends GetxController {
  onClickSSPItem({required MenuModel menuModel}) {
    if (menuModel.route != null) {
      Get.toNamed(menuModel.route!);
    }
  }
}
