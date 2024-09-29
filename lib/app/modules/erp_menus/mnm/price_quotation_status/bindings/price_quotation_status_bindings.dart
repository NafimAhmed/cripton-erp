//import 'package:flutter_cripton_erp_app/app/modules/mnm/price_quotation/controller/price_quotation_status_controller.dart';
import 'package:get/get.dart';

import '../controller/price_quotation_status_controller.dart';

class MNMPriceQuotationStatusBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PriceQuotationStatusController>(
        () => PriceQuotationStatusController());
  }
}
