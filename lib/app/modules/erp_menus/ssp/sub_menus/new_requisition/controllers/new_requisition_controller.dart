import 'package:get/get.dart';

import '../../../../../../models/menu.dart';
import '../../../../../../utils/snackbar.dart';

class NewRequisitionController extends GetxController {
  onTapNewRequisitionMenuItem(MenuModel menuModel) {
    final String? route = menuModel.route;
    if (route != null && route.isNotEmpty) {
      Get.toNamed(menuModel.route ?? '', arguments: menuModel);
    } else {
      showWarningSnackkbar(message: 'Route not found');
    }
  }
}
