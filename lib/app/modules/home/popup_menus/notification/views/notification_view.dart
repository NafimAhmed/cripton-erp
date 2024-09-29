import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notification_controller.dart';
import '../models/notification.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.notificationModelList.value = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(() => ListView.builder(
              itemCount: controller.notificationModelList.value.length,
              itemBuilder: (context, index) {
                NotificationModel model =
                    controller.notificationModelList.value[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.notifications_outlined),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${model.header}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${model.details}',
                              ),
                            ],
                          ),
                        ),
                        // const Expanded(
                        //     child: Text(
                        //   'Sunday, 20 Sept, 2020',
                        //   textAlign: TextAlign.right,
                        // ))
                      ],
                    ),
                  ),
                );
              })),
        ));
  }
}
