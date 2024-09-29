import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/my_approval.dart';
import '../controllers/ssp_approval_details_controller.dart';
import 'requisition_type_wise_views/general_store_requisition_detail.dart';
import 'requisition_type_wise_views/ict_store_requisition_detail.dart';
import 'requisition_type_wise_views/leave_requisition_detail.dart';
import 'requisition_type_wise_views/service_requisition_detail.dart';

class SspApprovalDetailsView extends GetView<SspApprovalDetailsController> {
  const SspApprovalDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments;
    MyApprovalModel? myApprovalModel = arguments['model'];
    controller.parentIndex = arguments['index'];
    controller.showAction = arguments['showAction'];
    controller
        .getDetailsAsRequisitionType(myApprovalModel ?? MyApprovalModel());
    return Scaffold(
      appBar: AppBar(
        title: Text(myApprovalModel?.reqDocName ?? 'SSP Approval Details'),
        centerTitle: true,
      ),
      body: RequisitionTypeWiseView(
        myApprovalModel ?? MyApprovalModel(),
      ),
    );
  }

  Widget RequisitionTypeWiseView(MyApprovalModel model) {
    switch (model.reqDocName ?? '') {
      case 'Leave Application':
        return Obx(() => LeaveRequisitiontionDeatils(
              controller: controller,
              myApprovalModel: model,
              leaveRequisitionDetailModel:
                  controller.leaveRequisitionDetailModel.value,
              onClickApprove: () {
                controller.onClickApprove(model: model);
              },
              onClickReject: () {
                controller.onClickReject(model: model);
              },
              commentController: controller.commentController,
            ));
      case 'General Product Store Requisition':
        return Obx(() => GeneralStoreRequisitionDetailView(
              controller: controller,
              myApprovalModel: model,
              generalStoreRequisitionDetail:
                  controller.generalStoreRequisitionDeatailsModel.value,
              onClickApprove: () {
                controller.onClickApprove(model: model);
              },
              onClickReject: () {
                controller.onClickReject(model: model);
              },
              commentController: controller.commentController,
            ));
      case 'ICT Product Store Requisition':
        return Obx(() => ICTStoreRequisitionDetailView(
              myApprovalModel: model,
              ictStoreRequisitionDetailModel:
                  controller.ictStoreRequisitionDeatailsModel.value,
              controller: controller,
              onClickApprove: () {
                controller.onClickApprove(model: model);
              },
              onClickReject: () {
                controller.onClickReject(model: model);
              },
              commentController: controller.commentController,
            ));
      case 'ICT Service Requisition':
        return Obx(() => ServiceRequisitionDetailView(
              myApprovalModel: model,
              controller: controller,
              serviceRequisitionDetailModel:
                  controller.serviceRequisitionDetail.value,
              onClickApprove: () {
                controller.onClickApprove(model: model);
              },
              onClickReject: () {
                controller.onClickReject(model: model);
              },
              commentController: controller.commentController,
            ));
      default:
        return Center(
          child: Text(
            '${model.reqDocName ?? ''}\nNot implemented yet',
            textAlign: TextAlign.center,
          ),
        );
    }
  }
}
