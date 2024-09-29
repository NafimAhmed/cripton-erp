import 'package:get/get.dart';

import '../../../../../data/login_creadential.dart';
import '../../../../../models/user.dart';
import '../../../../../services/api_communication.dart';

class ProfileController extends GetxController {
  late final UserModel user;
  late LoginCredential credential;
  late ApiCommunication _apiCommunication;

  @override
  void onInit() {
    super.onInit();
    credential = LoginCredential();
    user = credential.getUserData();
    _apiCommunication = ApiCommunication();
  }

  @override
  void onClose() {
    super.onClose();
    _apiCommunication.endConnection();
  }
}
