import 'package:get/get.dart';

import '../controllers/profile_pic_and_signature_controller.dart';

class ProfilePicAndSignatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePicAndSignatureController>(
      () => ProfilePicAndSignatureController(),
    );
  }
}
