import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../models/api_response.dart';
import '../../../../../../../services/api_communication.dart';
import '../../../my_approval/ssp_approval_details/model/general_store_approval_details.dart';
import '../../../my_approval/ssp_approval_details/model/ict_store_requisition_detail.dart';
import '../../../my_approval/ssp_approval_details/model/leave_requisition_detail.dart';
import '../../../my_approval/ssp_approval_details/model/service_requisition_detail.dart';
import '../../../my_approval/ssp_approval_details/model/ssp_approval_details.dart';
import '../../models/my_requisition.dart';

class MyRequisitionDetailsController extends GetxController {
  late ApiCommunication _apiCommunication;
  Rx<List<SSPApprovalDetailsModel?>> sspApprovalDeatailsModelList = Rx([]);
  Rx<SSPApprovalDetailsModel?> sspApprovalDeatailsModel = Rx(null);
  Rx<GeneralStoreApprovalDetails?> generalStoreRequisitionDeatailsModel =
      Rx(null);
  Rx<LeaveRequisitionDetailModel?> leaveRequisitionDetailModel = Rx(null);
  Rx<ICTStoreRequisitionDetailModel?> ictStoreRequisitionDeatailsModel =
      Rx(null);
  Rx<ServiceRequisitionDetailModel?> serviceRequisitionDetail = Rx(null);

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

  getDetailsAsRequisitionType(MyRequisitionModel model) {
    switch (model.reqDocName) {
      case 'Leave Application':
        getLeaveRequisitionDetails(model.id ?? '');
        break;
      case 'General Product Store Requisition':
        getGeneralStoreRequisitionDetails(model.id ?? '');
        break;
      case 'ICT Product Store Requisition':
        getICTStoreRequisitionDetails(model.id ?? '');
        break;
      case 'ICT Service Requisition':
        getSSPServiceRequisitionDetails(model.id ?? '');
        break;
      default:
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _apiCommunication = ApiCommunication();
  }

  @override
  void onReady() {
    // getMyApproval();
    super.onReady();
  }

  @override
  void onClose() {
    _apiCommunication.endConnection();
    super.onClose();
  }
}
