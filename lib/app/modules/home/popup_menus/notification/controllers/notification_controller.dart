import 'package:get/get.dart';

import '../models/notification.dart';

class NotificationController extends GetxController {
  Rx<List<NotificationModel>> notificationModelList =
      Rx<List<NotificationModel>>([]);
}
