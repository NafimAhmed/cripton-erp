import '../config/app_assets.dart';
import '../models/menu.dart';
import '../routes/app_pages.dart';

List<MenuModel> requisitionMenuData = [
  // MenuModel(
  //   titile: 'Attendance Requisition',
  //   icon: AppAssets.ATTENDANCE_REQUEST_ICON,
  //   route: Routes.ATTENDANCE_REQUISITION,
  // ),
  MenuModel(
    titile: 'Leave Requisition',
    icon: AppAssets.LEAVE_REQUEST_ICON,
    route: Routes.LEAVE_REQUISITION,
  ),
  MenuModel(
    titile: 'ICT Store Requisition',
    icon: AppAssets.ICT_HARDWARE_REQUEST_ICON,
    route: Routes.ICT_STORE_REQUISITION,
  ),
  MenuModel(
    titile: 'ICT Service Requisition',
    icon: AppAssets.ICT_SERVICE_REQUEST_ICON,
    route: Routes.ICT_SERVICE_REQUISITION,
  ),
  MenuModel(
    titile: 'General Store Requisition',
    icon: AppAssets.ICT_GENERAL_STORE_REQUEST_ICON,
    route: Routes.GENERAL_STORE_REQUISITION,
  ),
];
