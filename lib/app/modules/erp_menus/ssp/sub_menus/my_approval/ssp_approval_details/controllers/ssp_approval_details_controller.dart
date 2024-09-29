import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../models/api_response.dart';
import '../../../../../../../services/api_communication.dart';
import '../../../../../../../utils/dialog.dart';
import '../../../../../../home/controllers/home_controller.dart';
import '../../../new_requisition/sub_menus/general_store_requisition/model/general_product_model.dart';
import '../../../new_requisition/sub_menus/ict_store_requisition/models/ict_store.dart';
import '../../models/my_approval.dart';
import '../model/general_store_approval_details.dart';
import '../model/ict_store_requisition_detail.dart';
import '../model/leave_requisition_detail.dart';
import '../model/service_requisition_detail.dart';

class SspApprovalDetailsController extends GetxController {
  late ApiCommunication _apiCommunication;
  Rx<GeneralStoreApprovalDetails?> generalStoreRequisitionDeatailsModel =
      Rx(null);
  Rx<LeaveRequisitionDetailModel?> leaveRequisitionDetailModel = Rx(null);
  Rx<ICTStoreRequisitionDetailModel?> ictStoreRequisitionDeatailsModel =
      Rx(null);
  Rx<ServiceRequisitionDetailModel?> serviceRequisitionDetail = Rx(null);
  late TextEditingController commentController;
  int? parentIndex;
  late bool showAction;
  // Update Approvals data variable
  RxList<ICTStoreModel> storeProductItemList = RxList([]);
  RxList<GeneralProductModel> generalProductItemList = RxList([]);

  //===================================================== Leave ===========================================================//

  Future<void> getLeaveRequisitionDetails(String requisitionId) async {
    final ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Leave/GetLeaveRequisitionDetails',
      responseDataKey: 'data',
      requestData: {
        'requisitionId': requisitionId,
      },
      isFormData: false,
    );

    if (response.isSuccessful) {
      leaveRequisitionDetailModel.value = LeaveRequisitionDetailModel.fromMap(
          response.data as Map<String, dynamic>);
      debugPrint(leaveRequisitionDetailModel.toString());
    }
  }

  //===================================================== General Store ===========================================================//

  Future<void> getGeneralStoreRequisitionDetails(String requisitionId) async {
    final ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Requisition/GetSSPStoreRequisitionDetails',
      responseDataKey: 'data',
      requestData: {
        'requisitionId': requisitionId,
      },
      isFormData: false,
    );

    if (response.isSuccessful) {
      generalStoreRequisitionDeatailsModel.value =
          GeneralStoreApprovalDetails.fromMap(
              response.data as Map<String, dynamic>);
      debugPrint(generalStoreRequisitionDeatailsModel.toString());
    }
  }

  Future<List<GeneralProductModel>> getgeneralProductItemList(
      {required int page, String? searchKey}) async {
    ApiResponse response = await _apiCommunication.doPostRequest(
        apiEndPoint: 'Requisition/GetGeneralStoreProducts',
        requestData: {
          'rowIndex': (page - 1) * 20,
          'pageSize': 20,
          'searchContext': searchKey,
        });
    generalProductItemList.value = (response.data as List)
        .map((element) =>
            GeneralProductModel.fromMap(element as Map<String, dynamic>))
        .toList();

    return generalProductItemList;
  }

  //===================================================== ICT Store ===========================================================//

  Future<void> getICTStoreRequisitionDetails(String requisitionId) async {
    final ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Requisition/GetSSPStoreRequisitionDetails',
      responseDataKey: 'data',
      requestData: {
        'requisitionId': requisitionId,
      },
      isFormData: false,
    );

    if (response.isSuccessful) {
      debugPrint('Success');

      ictStoreRequisitionDeatailsModel.value =
          ICTStoreRequisitionDetailModel.fromMap(
              response.data as Map<String, dynamic>);
      debugPrint(generalStoreRequisitionDeatailsModel.toString());
    }
  }

  Future<List<ICTStoreModel>> getICTStoreProductList(
      {required int page, String? searchKey}) async {
    ApiResponse response = await _apiCommunication.doPostRequest(
        apiEndPoint: 'Requisition/GetICTStoreProducts',
        requestData: {
          'rowIndex': (page - 1) * 20,
          'pageSize': 20,
          'searchContext': searchKey,
        });
    storeProductItemList.value = (response.data as List)
        .map(
            (element) => ICTStoreModel.fromMap(element as Map<String, dynamic>))
        .toList();

    return storeProductItemList;
  }

  //===================================================== Service ===========================================================//

  Future<void> getSSPServiceRequisitionDetails(String requisitionId) async {
    final ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Requisition/GetSSPServiceRequisitionDetails',
      responseDataKey: 'data',
      requestData: {
        'requisitionId': requisitionId,
      },
      isFormData: false,
    );

    if (response.isSuccessful) {
      serviceRequisitionDetail.value = ServiceRequisitionDetailModel.fromMap(
          response.data as Map<String, dynamic>);
      debugPrint(serviceRequisitionDetail.toString());
    }
  }

  //========================================= Actions.. ============================================//

  Future<void> onClickApprove({required MyApprovalModel model}) async {
    showYesNoDialog(
        status: 'approve',
        onPressedYes: () async {
          Map<String, dynamic> inputData = {
            'id': '${model.id}',
            'status': 'Approved',
            'note': commentController.text,
            'items': getItemMapAsRequisitionType(model.reqDocName ?? ''),
          };

          final ApiResponse response = await _apiCommunication.doPostRequest(
            apiEndPoint: 'Requisition/ChangeSSPApprovalStatus',
            responseDataKey: 'data',
            requestData: inputData,
            isFormData: false,
          );
          if (response.isSuccessful) {
            refreshDashboardData();
            Get.back(result: parentIndex);
          } else {}
        });
  }

  Future<void> onClickReject({required MyApprovalModel model}) async {
    showYesNoDialog(
        status: 'reject',
        onPressedYes: () async {
          Map<String, dynamic> inputData = {
            'id': '${model.id}',
            'status': 'Rejected',
            'note': commentController.text,
            'items': getItemMapAsRequisitionType(model.reqDocName ?? ''),
          };

          final ApiResponse response = await _apiCommunication.doPostRequest(
            apiEndPoint: 'Requisition/ChangeSSPApprovalStatus',
            responseDataKey: 'data',
            requestData: inputData,
            isFormData: false,
          );
          if (response.isSuccessful) {
            refreshDashboardData();
            Get.back(result: parentIndex);
          } else {}
        });
  }

  void refreshDashboardData() {
    HomeController controller = Get.find();
    controller.getApprovalSummary();
  }

  List<Map<String, dynamic>> getItemMapAsRequisitionType(
    String requisitionType,
  ) {
    switch (requisitionType) {
      case 'Leave Application':
        return [];
      case 'General Product Store Requisition':
        return generalStoreRequisitionDeatailsModel.value?.itemList
                ?.map((itemModel) => {
                      'purpose': '',
                      'id': itemModel.id,
                      'productId': itemModel.appItemID,
                      'appQuantity': itemModel.appItemQty,
                      'reqQuantity': itemModel.reqItemQty,
                      'justification': itemModel.justification ?? '',
                    })
                .toList() ??
            [];
      case 'ICT Product Store Requisition':
        return ictStoreRequisitionDeatailsModel.value?.itemList
                ?.map((itemModel) => {
                      'purpose': '',
                      'id': itemModel.id,
                      'productId': itemModel.appItemID,
                      'appQuantity': itemModel.appItemQty,
                      'reqQuantity': itemModel.reqItemQty,
                      'justification': itemModel.justification ?? '',
                    })
                .toList() ??
            [];
      case 'ICT Service Requisition':
        return serviceRequisitionDetail.value?.itemList
                ?.map((itemModel) => {
                      'purpose': '',
                      'id': itemModel.id,
                      'productId': itemModel.appItemID,
                      'appQuantity': itemModel.appItemQty,
                      'reqQuantity': itemModel.reqItemQty,
                      'justification': itemModel.justification ?? '',
                    })
                .toList() ??
            [];
      default:
        return [];
    }
  }

  getDetailsAsRequisitionType(MyApprovalModel model) {
    switch (model.reqDocName) {
      case 'Leave Application':
        getLeaveRequisitionDetails(model.reqId ?? '');
        break;
      case 'General Product Store Requisition':
        getGeneralStoreRequisitionDetails(model.reqId ?? '');
        break;
      case 'ICT Product Store Requisition':
        getICTStoreRequisitionDetails(model.reqId ?? '');
        break;
      case 'ICT Service Requisition':
        getSSPServiceRequisitionDetails(model.reqId ?? '');
        break;
      default:
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _apiCommunication = ApiCommunication();
    commentController = TextEditingController();
  }

  @override
  void onReady() {
    // getMyApproval();
    super.onReady();
  }

  @override
  void onClose() {
    _apiCommunication.endConnection();
    commentController.dispose();
    super.onClose();
  }
}
