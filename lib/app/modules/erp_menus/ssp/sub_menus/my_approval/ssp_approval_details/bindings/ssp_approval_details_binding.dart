import 'package:get/get.dart';

import '../controllers/ssp_approval_details_controller.dart';

class SspApprovalDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SspApprovalDetailsController>(
      () => SspApprovalDetailsController(),
    );
  }
}
