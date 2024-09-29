import 'package:get/get.dart';

import '../controllers/my_approval_controller.dart';

class MyApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyApprovalController>(
      () => MyApprovalController(),
    );
  }
}
