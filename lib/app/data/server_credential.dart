import 'package:get_storage/get_storage.dart';

import '../config/app_storage.dart';

class ServerCredential {
  late final GetStorage _getStorage;
  ServerCredential() {
    _getStorage = GetStorage();
  }

  Future<void> saveIpPortData(String ipPort) async {
    await _getStorage.write(AppStorage.IP_PORT_DATA_KEY, ipPort);
  }

  Future<void> saveIpImagePath(String imagePath) async {
    await _getStorage.write(AppStorage.IMAGE_PATH_DATA_KEY, imagePath);
  }

  String? getIpPortData() {
    String? ipPort = _getStorage.read(AppStorage.IP_PORT_DATA_KEY);
    return ipPort;
  }

  String? getImagePathData() {
    String? imagePath = _getStorage.read(AppStorage.IMAGE_PATH_DATA_KEY);
    return imagePath;
  }

  void clearLoginCredential() {
    _getStorage.remove(AppStorage.AUTH_STATE_KEY);
    _getStorage.remove(AppStorage.TOKEN_KEY);
    _getStorage.remove(AppStorage.USER_DATA_KEY);
  }
}
