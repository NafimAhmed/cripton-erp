import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/erp_menu_data.dart';
import '../../../../../../models/menu.dart';
import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: attendenceMenus.length,
          itemBuilder: (context, index) {
            MenuModel requisitionMenuModel = attendenceMenus[index];
            return InkWell(
              onTap: () {
                controller.onTapAttendenceMenu(requisitionMenuModel);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Image(
                          height: 32,
                          image: AssetImage(requisitionMenuModel.icon)),
                      const SizedBox(width: 20),
                      Expanded(
                          flex: 1, child: Text(requisitionMenuModel.titile)),
                      const Icon(Icons.arrow_forward_ios, size: 16)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
