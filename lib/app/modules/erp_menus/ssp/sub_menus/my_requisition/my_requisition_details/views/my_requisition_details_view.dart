import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/my_requisition.dart';
import '../controllers/my_requisition_details_controller.dart';
import 'requisition_type_wise_views/general_store_requisition_detail.dart';
import 'requisition_type_wise_views/ict_store_requisition_detail.dart';
import 'requisition_type_wise_views/leave_requisition_detail.dart';
import 'requisition_type_wise_views/service_requisition_detail.dart';

class MyRequisitionDetailsView extends GetView<MyRequisitionDetailsController> {
  const MyRequisitionDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyRequisitionModel? myRequisitionModel = Get.arguments;
    controller.getDetailsAsRequisitionType(
        myRequisitionModel ?? MyRequisitionModel());
    return Scaffold(
      appBar: AppBar(
        title:
            Text(myRequisitionModel?.reqDocName ?? 'SSP Requisition Details'),
        centerTitle: true,
      ),
      body: RequisitionTypeWiseView(
        myRequisitionModel ?? MyRequisitionModel(),
      ),
    );
  }

  Widget RequisitionTypeWiseView(MyRequisitionModel model) {
    switch (model.reqDocName ?? '') {
      case 'Leave Application':
        return Obx(() => LeaveRequisitiontionDeatils(
              myRequisitionModel: model,
              leaveRequisitionDetailModel:
                  controller.leaveRequisitionDetailModel.value,
            ));
      case 'General Product Store Requisition':
        return Obx(() => GeneralStoreRequisitionDetailView(
              myRequisitionModel: model,
              generalStoreRequisitionDetail:
                  controller.generalStoreRequisitionDeatailsModel.value,
                  
            ));
      case 'ICT Product Store Requisition':
        return Obx(() => ICTStoreRequisitionDetailView(
              myRequisitionModel: model,
              ictStoreRequisitionDetailModel:
                  controller.ictStoreRequisitionDeatailsModel.value,
            ));
      case 'ICT Service Requisition':
        return Obx(() => ServiceRequisitionDetailView(
              myRequisitionModel: model,
              serviceRequisitionDetailModel:
                  controller.serviceRequisitionDetail.value,
            ));
      default:
        return Container();
    }
  }
}
