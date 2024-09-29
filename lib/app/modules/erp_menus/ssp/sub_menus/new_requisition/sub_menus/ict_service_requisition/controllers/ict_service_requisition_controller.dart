import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../../../models/api_response.dart';
import '../../../../../../../../services/api_communication.dart';
import '../../../../../../../../utils/snackbar.dart';
import '../../../../../../../home/controllers/home_controller.dart';
import '../model/ict_service.dart';
import '../model/ict_service_item.dart';

class IctServiceRequisitionController extends GetxController {
  late ApiCommunication _apiCommunication;
  late TextEditingController justificationController;
  late FocusNode justificationFocusNode;
  final GlobalKey<FormState> servciceRequisitionFormKey = GlobalKey();

  RxList<ICTServiceModel> ictServiceItemList = RxList([]);
  RxList<ICTServiceItemModel> addedServiceList = RxList([]);

  Rx<ICTServiceModel?> selectedIctServicesModel = Rx(null);

  Future<List<ICTServiceModel>> getICTServicesItemList() async {
    ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Requisition/GetAllSSPICTServices',
    );
    ictServiceItemList.value = (response.data as List)
        .map((element) =>
            ICTServiceModel.fromMap(element as Map<String, dynamic>))
        .toList();

    return ictServiceItemList;
  }

  void addICTServicesForRequisition(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (servciceRequisitionFormKey.currentState!.validate()) {
      if (selectedIctServicesModel.value != null) {
        if (!isServiceAlreadyAdded()) {
          addedServiceList.add(
            ICTServiceItemModel(
              productName: selectedIctServicesModel.value?.productName,
              reqItemId: selectedIctServicesModel.value?.id,
              justification: justificationController.text,
            ),
          );
          selectedIctServicesModel.value = null;
          justificationController.clear();
        } else {
          showErrorSnackkbar(message: 'This service is already added');
        }
      } else {
        showWarningSnackkbar(message: 'Service is not selected');
      }
    }
  }

  bool isServiceAlreadyAdded() {
    for (ICTServiceItemModel addedService in addedServiceList) {
      if (addedService.reqItemId == selectedIctServicesModel.value?.id) {
        return true;
      }
    }
    return false;
  }

  void removeProduct(index) {
    addedServiceList.removeAt(index);
    addedServiceList.refresh();
  }

  submitICTServiceRequisition() async {
    if (addedServiceList.isNotEmpty) {
      final ApiResponse response = await _apiCommunication.doPostRequest(
        apiEndPoint: 'Requisition/SaveSSPServiceRequisition',
        responseDataKey: 'data',
        requestData: {
          'item': [
            for (ICTServiceItemModel productModel in addedServiceList)
              {
                'reqItemId': productModel.reqItemId,
                'justification': productModel.justification
              }
          ]
        },
        isFormData: false,
        showSuccessMessage: true,
        successMessage: 'Submitted Successfully',
      );
      if (response.isSuccessful) {
        clearSubmittedData();
        refreshDashboardData();
      }
    } else {
      showWarningSnackkbar(message: 'You have not selected any product');
    }
  }

  void refreshDashboardData() {
    HomeController controller = Get.find();
    controller.getApprovalSummary();
  }

  void clearSubmittedData() {
    justificationController.clear();
    addedServiceList.clear();
  }

  @override
  void onInit() {
    justificationController = TextEditingController();
    justificationFocusNode = FocusNode();
    _apiCommunication = ApiCommunication();
    getICTServicesItemList();
    super.onInit();
  }

  @override
  void onClose() {
    _apiCommunication.endConnection();
    justificationController.dispose();
    justificationFocusNode.dispose();
    super.onClose();
  }
}
