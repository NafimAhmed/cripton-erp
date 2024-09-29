import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../components/button.dart';
import '../../../../../../components/dropdown.dart';
import '../../../../../../components/text_form_field.dart';
import '../../../../../../config/api_constant.dart';
import '../../../../../../data/login_creadential.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../../../services/api_communication.dart';
import '../../../../../../utils/date_time.dart';
import '../../../../../../utils/snackbar.dart';
import '../../../../../home/controllers/home_controller.dart';
import '../models/my_requisition.dart';

class MyRequisitionController extends GetxController {
  // Rest Api calling.
  late ApiCommunication _apiCommunication;
  // Cache Storage
  late LoginCredential loginCredential;
  // My Requisition List view
  Rx<List<MyRequisitionModel>> myRequisitionList =
      Rx<List<MyRequisitionModel>>([]);
  // Variable used in Pagination
  late ScrollController scrollController;
  int? totoalCount;
  //Filter
  late TextEditingController requisitionIdController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;
  List<String> statusList = ['Pending', 'Approved'];
  String seletedStatus = 'Pending';
  //For showing Date Picker
  late final BuildContext buildContext;
  // Refreashing Home data
  final HomeController homeController = Get.find();

  //======================================= Rest Api Calling ======================================//

  Future<void> getMyRequisition({int? startRow = 0}) async {
    final response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Requisition/GetMyRequisition',
      responseDataKey: 'data',
      requestData: {
        'reqNum': requisitionIdController.text,
        'fromDate': startDateController.text,
        'toDate': endDateController.text,
        'requesterID': '${loginCredential.getUserData().id}',
        'reqStatus': seletedStatus,
        'rowIndex': startRow,
        'pageSize': ApiConstant.LIST_VIEW_PAGE_SIZE
      },
      isFormData: false,
    );
    if (response.isSuccessful) {
      totoalCount = response.totalCount;
      if (startRow == 0) {
        myRequisitionList.value = (response.data as List)
            .map((element) =>
                MyRequisitionModel.fromJson(element as Map<String, dynamic>))
            .toList();
      } else {
        myRequisitionList.value.addAll((response.data as List)
            .map((element) =>
                MyRequisitionModel.fromJson(element as Map<String, dynamic>))
            .toList());
      }
      myRequisitionList.refresh();
    }
  }
//=========================================== On ui click ==============================================//
//=========================================== Filter Listview

  void onTapFilterIcon() {
    showFilterSheet();
  }

  void resetFilterData() {
    requisitionIdController.clear();
    startDateController.clear();
    endDateController.clear();
    seletedStatus = 'Pending';
  }

  showFilterSheet() {
    Get.bottomSheet(SingleChildScrollView(
      child: Container(
        height: Get.height / 2,
        width: Get.width,
        color: Colors.white,
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(onPressed: resetFilterData, child: const Text('Reset')),
            const SizedBox(height: 10),
            SecondaryTextFormField(
              label: 'Requisition Id',
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              controller: requisitionIdController,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ClickableTextFormField(
                    suffixIcon: Icons.date_range,
                    label: 'Start Date',
                    hints: 'DD-MM-YYYY',
                    inputFormatters: [DB_DATE_INPUT_FORMATE],
                    onIconTap: () {
                      onClickStartDateTextFormField(buildContext);
                    },
                    controller: startDateController,
                    validationText: 'Start date is required',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ClickableTextFormField(
                    inputFormatters: [DB_DATE_INPUT_FORMATE],
                    suffixIcon: Icons.date_range,
                    label: 'End Date',
                    hints: 'DD-MM-YYYY',
                    validationText: 'End date is required',
                    onIconTap: () {
                      onClickEndDateTextFormField(buildContext);
                    },
                    controller: endDateController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SecondaryDropDownField(
              list: statusList,
              selectedItem: seletedStatus,
              onChanged: (value) {
                if (value != null) {
                  seletedStatus = value.toString();
                }
              },
            ),
            const Expanded(child: SizedBox(height: 0)),
            Row(
              children: [
                Expanded(
                    child: PrimaryButton(
                        height: 40,
                        onPressed: () {
                          getMyRequisition();
                          Get.back();
                        },
                        text: 'Search')),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  void onClickStartDateTextFormField(BuildContext context) async {
    final DateTime? dateTime = await showDatePickerDialog(context: context);
    if (dateTime != null) {
      startDateController.text = getFormatedDateInDBFormate(dateTime);
    }
  }

  void onClickEndDateTextFormField(BuildContext context) async {
    final DateTime? dateTime = await showDatePickerDialog(context: context);
    if (startDateController.text.isNotEmpty) {
      if (dateTime != null) {
        int value = compareDateString(
            start: startDateController.text,
            end: getFormatedDateInDBFormate(dateTime));
        if (value == 0 || value < 0) {
          endDateController.text = getFormatedDateInDBFormate(dateTime);
        } else {
          showErrorSnackkbar(
              message: "End Date Can't Be Earlier Than Start Date");
        }
      }
    } else {
      showErrorSnackkbar(message: 'Select start date first');
    }
  }
//=========================================== On Click List Item

  void onClickPreview(MyRequisitionModel myRequisitionModel) {
    Get.toNamed(Routes.MY_REQUISITION_DETAILS, arguments: myRequisitionModel);
  }
//=========================================== For Scrolling List View

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if ((totoalCount ?? 0) > myRequisitionList.value.length) {
        // _loadMoreData();
        getMyRequisition(startRow: myRequisitionList.value.length);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    _apiCommunication = ApiCommunication();
    loginCredential = LoginCredential();
    scrollController = ScrollController();
    //Filter
    requisitionIdController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
  }

  @override
  void onReady() {
    scrollController.addListener(_scrollListener);
    getMyRequisition();
    super.onReady();
  }

  @override
  void onClose() {
    _apiCommunication.endConnection();
    scrollController.dispose();
    //Filter
    requisitionIdController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.onClose();
  }
}
