import '../config/app_assets.dart';
import '../models/menu.dart';
import '../routes/app_pages.dart';
//=========================================================== -------------ERP MAIN MENU------------ ===========================================================//

final List<MenuModel> erpMenus = [
  // MenuModel(
  //   titile: 'MIS',
  //   icon: AppAssets.MIS_ICON,
  // ),
  MenuModel(
    titile: 'SSP',
    icon: AppAssets.SSP_ICON,
    route: Routes.SSP,
  ),
  // MenuModel(
  //   titile: 'AP',
  //   icon: AppAssets.AP_ICON,
  // ),
  MenuModel(
    titile: 'HRIS',
    icon: AppAssets.HRIS_ICON,
    route: Routes.HRIS,
  ),
  // MenuModel(
  //   titile: 'M&M',
  //   icon: AppAssets.MNM_ICON,
  //   // route: Routes.MNM,
  // ),
  // MenuModel(
  //   titile: 'TNA',
  //   icon: AppAssets.TNA_ICON,
  //   // route: Routes.TNA,
  // ),
  // MenuModel(
  //   titile: 'PROC',
  //   icon: AppAssets.PROC_ICON,
  // ),
  // MenuModel(
  //   titile: 'MCD',
  //   icon: AppAssets.MCD_ICON,
  // ),
  // MenuModel(
  //   titile: 'IE',
  //   icon: AppAssets.IE_ICON,
  // ),
  // MenuModel(
  //   titile: 'Production',
  //   icon: AppAssets.PRODUCTION_ICON,
  // ),
  // MenuModel(
  //   titile: 'ACC',
  //   icon: AppAssets.ACC_ICON,
  // ),
  MenuModel(
    titile: 'Phonebook',
    icon: AppAssets.PHONE_BOOK_ICON,
    route: Routes.PHONEBOOK,
  ),
];
//=========================================================== SSP MENU ===========================================================//

final List<MenuModel> sspMenus = [
  MenuModel(
    titile: 'New Requisition',
    icon: AppAssets.NEW_REQUISITION_ICON,
    route: Routes.NEW_REQUISITION,
  ),
  MenuModel(
    titile: 'My Requisitions',
    icon: AppAssets.MY_REQUISITION_ICON,
    route: Routes.MY_REQUISITION,
  ),
  MenuModel(
    titile: 'SSP Approval',
    icon: AppAssets.SSP_APPROVAL_ICON,
    route: Routes.MY_APPROVAL,
  ),
];
//=========================================================== HRIS MENU ===========================================================//
final List<MenuModel> hrisMenus = [
  // MenuModel(
  //   titile: 'Personnel Info',
  //   icon: AppAssets.EMPLOYEE_ICON,
  //   // route: Routes.PROFILE_PIC_AND_SIGNATURE,
  // ),
  // MenuModel(
  //   titile: 'Employee Budget',
  //   icon: AppAssets.BUDGET_ICON,
  //   route: Routes.EMPLOYEE_BUDGET,
  // ),
  MenuModel(
    titile: 'Attendance',
    icon: AppAssets.ATTENDANCE_ICON,
    route: Routes.ATTENDANCE,
  ),
  // MenuModel(
  //   titile: 'Overtime',
  //   icon: AppAssets.OVERTIME_ICON,
  //   // route: Routes.PROFILE_PIC_AND_SIGNATURE,
  // ),
  // MenuModel(
  //   titile: 'Payroll',
  //   icon: AppAssets.SALARY_ICON,
  //   // route: Routes.PROFILE_PIC_AND_SIGNATURE,
  // ),
  MenuModel(
    titile: 'Upload Images',
    icon: AppAssets.UPLOAD_IMAGES_ICON,
    route: Routes.PROFILE_PIC_AND_SIGNATURE,
  ),
];
//=========================================================== ATTENDANCE MENU

final List<MenuModel> attendenceMenus = [
  MenuModel(
    titile: 'My Attendance',
    icon: AppAssets.MY_ATTENDANCE_ICON,
    // route: Routes.PROFILE_PIC_AND_SIGNATURE,
  ),
  MenuModel(
    titile: 'Attendence Submission',
    icon: AppAssets.ATTENDANCE_SUBMISSION_ICON,
    route: Routes.ATTENDANCE_SUBMISSION,
  ),
];
//=========================================================== EMPLOYEE BUDGET MENU
final List<MenuModel> employeeBudgetMenus = [
  MenuModel(
    titile: 'Budget vs Actual',
    icon: AppAssets.BUDGET_VS_ACTUAL_ICON,
    // route: Routes.PROFILE_PIC_AND_SIGNATURE,
  ),
];
