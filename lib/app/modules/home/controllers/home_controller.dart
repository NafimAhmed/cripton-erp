import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/api_constant.dart';
import '../../../data/login_creadential.dart';
import '../../../models/api_response.dart';
import '../../../models/menu.dart';
import '../../../models/user.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_communication.dart';
import '../../../utils/color.dart';
import '../../../utils/snackbar.dart';
import '../models/approval_summary.dart';
import '../models/attendance_chart.dart';
import '../models/attendence_summary.dart';
import '../popup_menus/notification/models/notification.dart';

class HomeController extends GetxController {
  late final UserModel user;
  late LoginCredential credential;
  late ApiCommunication _apiCommunication;
  late final CarouselController carouselController;

  Rx<String> monthlyAttendanceInfo = ''.obs;

  Rx<int> notificationCount = 10.obs;

  Rx<List<NotificationModel>> notificationModelList =
      Rx<List<NotificationModel>>([]);

  Rx<List<ApprovalSummaryModel>> approvalSummaryModelList =
      Rx<List<ApprovalSummaryModel>>([]);
  //Attendence
  Rx<List<AttendanceChartModel>> attendenceSummaryModelList =
      Rx<List<AttendanceChartModel>>([]);

  Rx<AttendenceSummaryModel?> attendanceSummary = Rx(null);
  //======================================== API Calling ========================================//

  getAttendanceSummary() async {
    final ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Attendance/GetDashboardAttendanceSummary',
      responseDataKey: 'data',
      requestData: {
        // 'regionId': user.regionId,
        // 'organizationId': user.organizationId,
      },
    );
    if (response.isSuccessful) {
      final attendanceSummaryMap = response.data as Map<String, dynamic>;
      attendanceSummary.value =
          AttendenceSummaryModel.fromMap(attendanceSummaryMap);
      createDataForChart();
    }
  }

  createDataForChart() {
    List<AttendanceChartModel> attendanceChartModel = [];
    attendanceChartModel.add(
      AttendanceChartModel(
        titile: 'Absent',
        percentage: attendanceSummary.value?.absentPercent ?? 0,
        color: ABSENT_COLOR,
      ),
    );

    attendanceChartModel.add(
      AttendanceChartModel(
        titile: 'Leave',
        percentage: attendanceSummary.value?.leavePercent ?? 0,
        color: LEAVE_COLOR,
      ),
    );
    if (user.userType == 'Sys Admin') {
      attendanceChartModel.add(
        AttendanceChartModel(
          titile: 'Holiday',
          percentage: attendanceSummary.value?.holidayPercent ?? 0,
          color: HOLIDAY_COLOR,
        ),
      );
    }
    attendanceChartModel.add(
      AttendanceChartModel(
        titile: 'Present',
        percentage: attendanceSummary.value?.presentPercent ?? 0,
        color: PRESENT_COLOR,
      ),
    );

    attendenceSummaryModelList.value = attendanceChartModel;
    attendenceSummaryModelList.refresh();
  }

  getApprovalSummary() async {
    final ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'SspNotification/GetDashboardNotification',
      responseDataKey: 'data',
    );
    if (response.isSuccessful) {
      List data = response.data as List;
      approvalSummaryModelList.value = data
          .map((element) =>
              ApprovalSummaryModel.fromMap(element as Map<String, dynamic>))
          .toList();
    }
  }

  getNotificationList() async {
    final ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'SspNotification/GetNotificationUserWise',
      responseDataKey: ApiConstant.FULL_RESPONSE,
    );
    if (response.isSuccessful && response.data != null) {
      final fullResponse = response.data as Map<String, dynamic>;
      notificationModelList.value = (fullResponse['data'] as List)
          .map((element) =>
              NotificationModel.fromMap(element as Map<String, dynamic>))
          .toList();
      notificationCount.value = response.totalCount ?? 0;
    } else {
      notificationCount.value = 0;
    }
  }

  //======================================== Carousel ========================================//
  void onClickForwardCarousel() {
    carouselController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void onClickBackwardCarousel() {
    carouselController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  //======================================== On Click Functions ========================================//

  void onClickERPMenue(MenuModel menuModel) {
    if (menuModel.route != null) {
      Get.toNamed(menuModel.route!);
    } else {
      showSnackkbar(
          titile: 'Upcomming!',
          message: '${menuModel.titile} is under development.');
    }
  }

  void onClicApprovalSummaryItem(
      {required ApprovalSummaryModel approvalSummaryModel}) {
    String? routeName;
    switch (approvalSummaryModel.targetURL) {
      case 'ssp_approval':
        routeName = Routes.MY_APPROVAL;
        break;
      case 'ap_approval':
        routeName = null;
        break;
      case 'my_requisition':
        routeName = Routes.MY_REQUISITION;
        break;
      default:
        routeName = null;
        break;
    }
    if (routeName != null) {
      Get.toNamed(routeName);
    } else {
      showWarningSnackkbar(
          message:
              '${approvalSummaryModel.title ?? 'This menu'} is under development');
    }
  }

  //======================================== OnClick Popup Menu ========================================//
  void onClickLogout() {
    credential.clearLoginCredential();
    Get.offAllNamed(Routes.LOGIN);
  }

  onClickNotification() {
    Get.toNamed(Routes.NOTIFICATION, arguments: notificationModelList.value);
  }

  @override
  void onInit() {
    super.onInit();
    credential = LoginCredential();
    user = credential.getUserData();
    _apiCommunication = ApiCommunication();
    carouselController = CarouselController();
  }

  @override
  void onReady() async {
    await getAttendanceSummary();
    await getNotificationList();
    await getApprovalSummary();

    super.onReady();
  }

  @override
  void onClose() {
    _apiCommunication.endConnection();
    super.onClose();
  }
}
