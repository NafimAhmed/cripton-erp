import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cripton_erp_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../../../../components/button.dart';
import '../../../../../../components/dropdown.dart';
import '../../../../../../components/text_form_field.dart';
import '../../../../../../config/api_constant.dart';
import '../../../../../../data/login_creadential.dart';
import '../../../../../../models/api_response.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../../../services/api_communication.dart';
import '../../../../../../utils/date_time.dart';
import '../../../../../../utils/snackbar.dart';
import '../models/my_approval.dart';

class MyApprovalController extends GetxController {
  // Rest Api calling.
  late ApiCommunication _apiCommunication;
  // Cache Storage
  late LoginCredential loginCredential;
  // Approval List view
  Rx<List<MyApprovalModel>> myApprovalList = Rx<List<MyApprovalModel>>([]);
  // Variable used in Pagination
  late ScrollController scrollController;
  int? totoalCount;
  // Selection on Approval List
  List<MyApprovalModel> selectedMyApprovalList = [];
  Rx<bool> isSelecting = false.obs;
  //Filter
  late TextEditingController requisitionIdController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;
  List<String> statusList = ['Pending', 'Approved'];
  Rx<String?> seletedStatus = 'Pending'.obs;
  //For showing Date Picker
  late final BuildContext buildContext;
  // Refreashing Home data
  final HomeController homeController = Get.find();

  //======================================= Rest Api Calling ======================================//

  Future<void> getMyApproval({int? startRow = 0}) async {
    final ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Requisition/GetSSPReqForApproval',
      responseDataKey: 'data',
      requestData: {
        'fromDate': startDateController.text,
        'toDate': endDateController.text,
        'reqNum': requisitionIdController.text,
        'status': seletedStatus.value,
        'rowIndex': startRow,
        'pageSize': ApiConstant.LIST_VIEW_PAGE_SIZE,
      },
      isFormData: false,
    );

    if (response.isSuccessful) {
      totoalCount = response.totalCount;
      if (startRow == 0) {
        myApprovalList.value = (response.data as List)
            .map((element) =>
                MyApprovalModel.fromMap(element as Map<String, dynamic>))
            .toList();
      } else {
        myApprovalList.value.addAll((response.data as List)
            .map((element) =>
                MyApprovalModel.fromMap(element as Map<String, dynamic>))
            .toList());
      }

      myApprovalList.refresh();
    }
  }

  Future<void> onApprove({required MyApprovalModel model}) async {
    Map<String, dynamic> inputData = {
      'id': '${model.id}',
      'status': 'Approved',
      'note': ''
    };

    final ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Requisition/ChangeSSPApprovalStatus',
      responseDataKey: 'data',
      requestData: inputData,
      isFormData: false,
    );
    if (response.isSuccessful) {
    } else {}
  }

  Future<void> onReject({required MyApprovalModel model}) async {
    Map<String, dynamic> inputData = {
      'id': '${model.id}',
      'status': 'Rejected',
      'note': ''
    };

    final ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Requisition/ChangeSSPApprovalStatus',
      responseDataKey: 'data',
      requestData: inputData,
      isFormData: false,
    );
    if (response.isSuccessful) {
    } else {}
  }

  //======================================= Selection List Item ====================================//

  bool isContainingInSelectedList(MyApprovalModel myApprovalModel) {
    bool value = selectedMyApprovalList.contains(myApprovalModel);
    return value;
  }

  void selectOrDeselectAll() {
    if (isAllSelected()) {
      selectedMyApprovalList.clear();
      isSelecting.value = false;
      myApprovalList.refresh();
    } else {
      selectedMyApprovalList.clear();
      selectedMyApprovalList.addAll(myApprovalList.value);
      myApprovalList.refresh();
    }
  }

  bool isAllSelected() {
    return myApprovalList.value.length == selectedMyApprovalList.length;
  }

  void itemSelectionForBulkApproveOrRejection(MyApprovalModel myApprovalModel) {
    if (isContainingInSelectedList(myApprovalModel)) {
      // Selected list already containing this item
      selectedMyApprovalList.remove(myApprovalModel); // So remove this item
      if (selectedMyApprovalList.isEmpty) {
        // After removing item seleted list is now empty
        isSelecting.value = false; // Turn of selection mode
      }
    } else {
      // This item is new to seleted list
      isSelecting.value = true; // Selection mode on
      selectedMyApprovalList.add(myApprovalModel); // So add this item
    }

    myApprovalList.refresh();
  }

  String getNameAsSelectedItemLength(String name) {
    if (selectedMyApprovalList.length > 1) {
      return name;
    } else {
      return name.split(' ')[0];
    }
  }

  void removeItemFromBulkApproveOrRejection(MyApprovalModel myApprovalModel) {
    selectedMyApprovalList.remove(myApprovalModel);
    myApprovalList.refresh();
    if (selectedMyApprovalList.isEmpty) {
      isSelecting.value = false;
    }
  }

//=========================================== On ui click ==============================================//

//=========================================== Bulk Approve Reject

  void bulkApprove() async {
    for (MyApprovalModel model in selectedMyApprovalList) {
      await onApprove(model: model);
    }
    showSuccessSnackkbar(message: 'Selected Requisition Approved.');
    getMyApproval();
    homeController.getApprovalSummary();
    isSelecting.value = false;
  }

  void bulkReject() async {
    for (MyApprovalModel model in selectedMyApprovalList) {
      await onReject(model: model);
    }
    showSuccessSnackkbar(message: 'Selected Requisition Rejected.');
    getMyApproval();
    homeController.getApprovalSummary();
    isSelecting.value = false;
  }

//=========================================== Filter Listview

  void onTapFilterIcon() {
    showFilterSheet();
  }

  void showFilterSheet() {
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
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              label: 'Requisition Id',
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
            Obx(() => SecondaryDropDownField(
                  list: statusList,
                  selectedItem: seletedStatus.value,
                  onChanged: (value) {
                    if (value != null) {
                      seletedStatus.value = value.toString();
                    }
                  },
                )),
            const Expanded(child: SizedBox(height: 0)),
            Row(
              children: [
                Expanded(
                    child: PrimaryButton(
                        height: 40,
                        onPressed: () {
                          getMyApproval();
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

  void resetFilterData() {
    requisitionIdController.clear();
    startDateController.clear();
    endDateController.clear();
    seletedStatus.value = 'Pending';
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

  void onClickSSPApprovalListItem(
      {required MyApprovalModel model, required int index}) async {
    var itemIndex = await Get.toNamed(Routes.SSP_APPROVAL_DETAILS, arguments: {
      'model': model,
      'index': index,
      'showAction': seletedStatus.value == 'Pending' ? true : false
    });
    if (itemIndex != null) {
      showSuccessSnackkbar(message: 'Action done successfully');
      myApprovalList.value.removeAt(itemIndex);
      myApprovalList.refresh();
    } else {}
    debugPrint(index.toString());
  }

//=========================================== On Click List Item

  void onClickPreview({required MyApprovalModel model}) {
    String? filePath = model.reqDocPath;
    if (filePath != null && filePath.isNotEmpty) {
      Get.toNamed(Routes.FILE_PREVIEW,
          arguments: '${ApiConstant.SERVER_IP_PORT}$filePath');
    } else {
      showWarningSnackkbar(message: 'No file available');
    }
  }

//=========================================== For Scrolling List View

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // Load more data when the user reaches the end of the list
      if ((totoalCount ?? 0) > myApprovalList.value.length) {
        // _loadMoreData();
        getMyApproval(startRow: myApprovalList.value.length);
      }
      debugPrint('Load More Data${myApprovalList.value.length}');
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
    getMyApproval();
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
