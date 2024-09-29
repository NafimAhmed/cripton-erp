import 'package:get/get.dart';

import '../controllers/employee_budget_controller.dart';

class EmployeeBudgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeBudgetController>(
      () => EmployeeBudgetController(),
    );
  }
}
