import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/erp_menu_data.dart';
import '../../../../../../models/menu.dart';
import '../controllers/employee_budget_controller.dart';

class EmployeeBudgetView extends GetView<EmployeeBudgetController> {
  const EmployeeBudgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Budget'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: employeeBudgetMenus.length,
          itemBuilder: (context, index) {
            MenuModel attendanceMenu = employeeBudgetMenus[index];
            return InkWell(
              onTap: () {
                controller.onTapEmployeeBudgetMenu(attendanceMenu);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Image(height: 32, image: AssetImage(attendanceMenu.icon)),
                      const SizedBox(width: 20),
                      Expanded(flex: 1, child: Text(attendanceMenu.titile)),
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
