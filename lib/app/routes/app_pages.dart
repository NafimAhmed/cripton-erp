import 'package:get/get.dart';

import '../modules/authentication/api_config/bindings/api_config_binding.dart';
import '../modules/authentication/api_config/views/api_config_view.dart';
import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/splash/bindings/splash_binding.dart';
import '../modules/authentication/splash/views/splash_view.dart';
import '../modules/company/bindings/company_binding.dart';
import '../modules/company/views/company_view.dart';
import '../modules/erp_menus/hris/bindings/hris_binding.dart';
import '../modules/erp_menus/hris/sub_menus/attendance/bindings/attendance_binding.dart';
import '../modules/erp_menus/hris/sub_menus/attendance/sub_menus/attendance_submission/bindings/attendance_submission_binding.dart';
import '../modules/erp_menus/hris/sub_menus/attendance/sub_menus/attendance_submission/views/attendance_submission_view.dart';
import '../modules/erp_menus/hris/sub_menus/attendance/views/attendance_view.dart';
import '../modules/erp_menus/hris/sub_menus/employee_budget/bindings/employee_budget_binding.dart';
import '../modules/erp_menus/hris/sub_menus/employee_budget/views/employee_budget_view.dart';
import '../modules/erp_menus/hris/sub_menus/profile_pic_and_signature/bindings/profile_pic_and_signature_binding.dart';
import '../modules/erp_menus/hris/sub_menus/profile_pic_and_signature/views/profile_pic_and_signature_view.dart';
import '../modules/erp_menus/hris/views/hris_view.dart';
import '../modules/erp_menus/mnm/enquery_status/bindings/mnm_enquery_status_bindings.dart';
import '../modules/erp_menus/mnm/enquery_status/views/mnm_enquery_status.dart';
import '../modules/erp_menus/mnm/mnm_dashboard/bindings/mnm_bindings.dart';
import '../modules/erp_menus/mnm/mnm_dashboard/views/mnm_views.dart';
import '../modules/erp_menus/mnm/mnm_inquery/bindings/mnm_inquery_bindings.dart';
import '../modules/erp_menus/mnm/mnm_inquery/views/mnm_inquery_views.dart';
import '../modules/erp_menus/mnm/price_quotation_status/bindings/price_quotation_status_bindings.dart';
import '../modules/erp_menus/mnm/price_quotation_status/views/price_quotation_status_views.dart';
import '../modules/erp_menus/phonebook/bindings/phonebook_binding.dart';
import '../modules/erp_menus/phonebook/views/phonebook_view.dart';
import '../modules/erp_menus/ssp/bindings/ssp_binding.dart';
import '../modules/erp_menus/ssp/sub_menus/my_approval/bindings/my_approval_binding.dart';
import '../modules/erp_menus/ssp/sub_menus/my_approval/ssp_approval_details/bindings/ssp_approval_details_binding.dart';
import '../modules/erp_menus/ssp/sub_menus/my_approval/ssp_approval_details/views/ssp_approval_details_view.dart';
import '../modules/erp_menus/ssp/sub_menus/my_approval/views/my_approval_view.dart';
import '../modules/erp_menus/ssp/sub_menus/my_requisition/bindings/my_requisition_binding.dart';
import '../modules/erp_menus/ssp/sub_menus/my_requisition/my_requisition_details/bindings/my_requisition_details_binding.dart';
import '../modules/erp_menus/ssp/sub_menus/my_requisition/my_requisition_details/views/my_requisition_details_view.dart';
import '../modules/erp_menus/ssp/sub_menus/my_requisition/views/my_requisition_view.dart';
import '../modules/erp_menus/ssp/sub_menus/new_requisition/bindings/new_requisition_binding.dart';
import '../modules/erp_menus/ssp/sub_menus/new_requisition/sub_menus/attendance_requisition/bindings/attendance_requisition_binding.dart';
import '../modules/erp_menus/ssp/sub_menus/new_requisition/sub_menus/attendance_requisition/views/attendance_requisition_view.dart';
import '../modules/erp_menus/ssp/sub_menus/new_requisition/sub_menus/general_store_requisition/bindings/general_store_requisition_binding.dart';
import '../modules/erp_menus/ssp/sub_menus/new_requisition/sub_menus/general_store_requisition/views/general_store_requisition_view.dart';
import '../modules/erp_menus/ssp/sub_menus/new_requisition/sub_menus/ict_service_requisition/bindings/ict_service_requisition_binding.dart';
import '../modules/erp_menus/ssp/sub_menus/new_requisition/sub_menus/ict_service_requisition/views/ict_service_requisition_view.dart';
import '../modules/erp_menus/ssp/sub_menus/new_requisition/sub_menus/ict_store_requisition/bindings/ict_store_requisition_binding.dart';
import '../modules/erp_menus/ssp/sub_menus/new_requisition/sub_menus/ict_store_requisition/views/ict_store_requisition_view.dart';
import '../modules/erp_menus/ssp/sub_menus/new_requisition/sub_menus/leave_requisition/bindings/leave_requisition_binding.dart';
import '../modules/erp_menus/ssp/sub_menus/new_requisition/sub_menus/leave_requisition/views/leave_requisition_view.dart';
import '../modules/erp_menus/ssp/sub_menus/new_requisition/views/new_requisition_view.dart';
import '../modules/erp_menus/ssp/views/ssp_view.dart';
import '../modules/erp_menus/tna/tna_home/bindings/tna_home_bindings.dart';
import '../modules/erp_menus/tna/tna_home/view/tna_view.dart';
import '../modules/erp_menus/tna/tna_traffic_light/bindings/tna_traffic_light_bindings.dart';
import '../modules/erp_menus/tna/tna_traffic_light/view/tna_trafficlight_view.dart';
import '../modules/file_preview/bindings/file_preview_binding.dart';
import '../modules/file_preview/views/file_preview_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/popup_menus/change_password/bindings/change_password_binding.dart';
import '../modules/home/popup_menus/change_password/views/change_password_view.dart';
import '../modules/home/popup_menus/notification/bindings/notification_binding.dart';
import '../modules/home/popup_menus/notification/views/notification_view.dart';
import '../modules/home/popup_menus/profile/bindings/profile_binding.dart';
import '../modules/home/popup_menus/profile/views/profile_view.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.SSP,
      page: () => const SspView(),
      binding: SspBinding(),
    ),
    GetPage(
      name: _Paths.NEW_REQUISITION,
      page: () => const NewRequisitionView(),
      binding: NewRequisitionBinding(),
    ),
    GetPage(
      name: _Paths.MY_REQUISITION,
      page: () => const MyRequisitionView(),
      binding: MyRequisitionBinding(),
    ),
    GetPage(
      name: _Paths.MY_APPROVAL,
      page: () => const MyApprovalView(),
      binding: MyApprovalBinding(),
    ),
    GetPage(
      name: _Paths.PHONEBOOK,
      page: () => const PhonebookView(),
      binding: PhonebookBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ATTENDANCE_REQUISITION,
      page: () => const AttendanceRequisitionView(),
      binding: AttendanceRequisitionBinding(),
    ),
    GetPage(
      name: _Paths.LEAVE_REQUISITION,
      page: () => const LeaveRequisitionView(),
      binding: LeaveRequisitionBinding(),
    ),
    GetPage(
      name: _Paths.GENERAL_STORE_REQUISITION,
      page: () => const GeneralStoreRequisitionView(),
      binding: GeneralStoreRequisitionBinding(),
    ),
    GetPage(
      name: _Paths.ICT_STORE_REQUISITION,
      page: () => const IctStoreRequisitionView(),
      binding: IctStoreRequisitionBinding(),
    ),
    GetPage(
      name: _Paths.ICT_SERVICE_REQUISITION,
      page: () => const IctServiceRequisitionView(),
      binding: IctServiceRequisitionBinding(),
    ),
    GetPage(
      name: _Paths.TNA,
      page: () => const TNAView(),
      binding: TNAHomeBinding(),
    ),
    GetPage(
      name: _Paths.TNA_TRAFFIC,
      page: () => const TNATrafficLightView(),
      binding: TNATrafficBinding(),
    ),
    GetPage(
      name: _Paths.MNM,
      page: () => const MNMViews(),
      binding: MNMBinding(),
    ),
    GetPage(
      name: _Paths.MNM_INQUERY,
      page: () => const MNMInqueryViews(),
      binding: MNMInqueryBinding(),
    ),
    GetPage(
      name: _Paths.PRICE_QUOTATION,
      page: () => const PriceQuotationStatusView(),
      binding: MNMPriceQuotationStatusBindings(),
    ),
    GetPage(
      name: _Paths.MNM_ENQUERY_STATUS,
      page: () => const MNMEnqueryStatusViews(),
      binding: MNMEnqueryStatusBinding(),
    ),
    GetPage(
      name: _Paths.API_CONFIG,
      page: () => const ApiConfigView(),
      binding: ApiConfigBinding(),
    ),
    GetPage(
      name: _Paths.FILE_PREVIEW,
      page: () => const FilePreviewView(),
      binding: FilePreviewBinding(),
    ),
    GetPage(
      name: _Paths.ATTENDANCE_SUBMISSION,
      page: () => const AttendanceSubmissionView(),
      binding: AttendanceSubmissionBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.SSP_APPROVAL_DETAILS,
      page: () => const SspApprovalDetailsView(),
      binding: SspApprovalDetailsBinding(),
    ),
    GetPage(
      name: _Paths.HRIS,
      page: () => const HrisView(),
      binding: HrisBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PIC_AND_SIGNATURE,
      page: () => const ProfilePicAndSignatureView(),
      binding: ProfilePicAndSignatureBinding(),
    ),
    GetPage(
      name: _Paths.MY_REQUISITION_DETAILS,
      page: () => const MyRequisitionDetailsView(),
      binding: MyRequisitionDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ATTENDANCE,
      page: () => const AttendanceView(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: _Paths.COMPANY,
      page: () => const CompanyView(),
      binding: CompanyBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_BUDGET,
      page: () => const EmployeeBudgetView(),
      binding: EmployeeBudgetBinding(),
    ),
  ];
}
