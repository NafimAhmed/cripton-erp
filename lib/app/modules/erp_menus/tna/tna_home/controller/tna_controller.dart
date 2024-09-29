import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/app_assets.dart';
import '../../../../../data/login_creadential.dart';
import '../../../../../models/menu.dart';
import '../../../../../models/user.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/snackbar.dart';
import '../../../../home/models/attendance_chart.dart';

class TNAHomeController extends GetxController {
  List<MenuModel> tNAList = [
    MenuModel(
      titile: 'MIS',
      icon: AppAssets.MIS_ICON,
      //route: Routes.PHONEBOOK
    ),
    MenuModel(
      titile: 'SSP',
      icon: AppAssets.SSP_ICON,
      //route: Routes.SSP,
    ),
    MenuModel(
      titile: 'AP',
      icon: AppAssets.AP_ICON,
    ),
    MenuModel(
        titile: 'TNA Traffic Light',
        icon: 'assets/icons/tna2.png',
        route: Routes.TNA_TRAFFIC),
    MenuModel(
      titile: 'HRIS',
      icon: 'assets/icons/hris.png',
    ),
    MenuModel(
      titile: 'M&M',
      icon: 'assets/icons/mnm.png',
    ),
    MenuModel(
      titile: 'PROC',
      icon: 'assets/icons/proc.png',
    ),
    MenuModel(
      titile: 'MCD',
      icon: 'assets/icons/mcd2.png',
    ),
    MenuModel(
      titile: 'IE',
      icon: 'assets/icons/ie.png',
    ),
    MenuModel(
      titile: 'Production',
      icon: 'assets/icons/production.png',
    ),
    MenuModel(
      titile: 'ACC',
      icon: 'assets/icons/acc.png',
    ),
    MenuModel(
      titile: 'Phonebook',
      icon: 'assets/icons/phone_book.png',
    ),
  ];

  late TextEditingController startDateCont;
  late TextEditingController endDateCont;

  final List<String> jobNoList = ['123', '456', '789'];
  final List<String> styleRefList = ['098', '765', '432'];
  final List<String> companyList = ['ABC', 'Sara', 'Artisan'];
  final List<String> buyerList = ['H&M', 'Livise', 'ADDIDAS'];

  late final UserModel user;
  late LoginCredential credential;

  void onClickTNAMenue(String? route) {
    if (route != null) {
      Get.toNamed(route);
    } else {
      showWarningSnackkbar(
          titile: 'Upcomming!', message: 'This menu is under development.');
    }
  }

  @override
  void onInit() {
    super.onInit();
    startDateCont = TextEditingController();
    endDateCont = TextEditingController();
    credential = LoginCredential();
    user = credential.getUserData();
  }

  @override
  void onClose() {
    super.onClose();
    startDateCont.dispose();
    endDateCont.dispose();
  }

  void onClickERPMenue(String? route) {
    if (route != null) {
      Get.toNamed(route);
    } else {
      showWarningSnackkbar(
          titile: 'Upcomming!', message: 'This menu is under development.');
    }
  }

  List<AttendanceChartModel> tNAChartModel = [
    AttendanceChartModel(
      titile: '',
      percentage: 51,
      color: Colors.green,
    ),
    AttendanceChartModel(
      titile: '',
      percentage: 21,
      color: Colors.indigo,
    ),
    AttendanceChartModel(
      titile: '',
      percentage: 17,
      color: Colors.cyan,
    ),
    AttendanceChartModel(
      titile: '',
      percentage: 11,
      color: Colors.red,
    ),
  ];
}
