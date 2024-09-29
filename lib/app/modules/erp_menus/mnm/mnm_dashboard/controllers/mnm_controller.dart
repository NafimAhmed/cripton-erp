import 'package:get/get.dart';

import '../../../../../config/app_assets.dart';
import '../../../../../models/menu.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/snackbar.dart';

class MNMController extends GetxController {
  List<MenuModel> MNMList = [
    MenuModel(
        titile: 'Inquiry', icon: AppAssets.MIS_ICON, route: Routes.MNM_INQUERY),
    MenuModel(
      titile: 'Price Quotation',
      icon: AppAssets.SSP_ICON,
      route: Routes.PRICE_QUOTATION,
    ),
    MenuModel(
      titile: 'Price Quotation Send',
      icon: 'assets/icons/tna2.png',
      // route: Routes.TNA_TRAFFIC
    ),
    MenuModel(
      titile: 'Order Status',
      icon: 'assets/icons/hris.png',
    ),
    MenuModel(
      titile: 'Budget',
      icon: 'assets/icons/mnm.png',
    ),
    MenuModel(
      titile: 'Fabric Booking',
      icon: 'assets/icons/proc.png',
    ),
    MenuModel(
      titile: 'Yarn Requisition ',
      icon: 'assets/icons/mcd2.png',
    ),
    MenuModel(
      titile: 'Trims Booking ',
      icon: 'assets/icons/ie.png',
    ),
    // MenuModel(
    //   titile: 'Production',
    //   icon: 'assets/icons/production.png',
    // ),
    // MenuModel(
    //   titile: 'ACC',
    //   icon: 'assets/icons/acc.png',
    // ),
    // MenuModel(
    //   titile: 'Phonebook',
    //   icon: 'assets/icons/phone_book.png',
    // ),
  ];

  void onClickMNMMenue(String? route) {
    if (route != null) {
      Get.toNamed(route);
    } else {
      showWarningSnackkbar(
          titile: 'Upcomming!', message: 'This menu is under development.');
    }
  }
}
