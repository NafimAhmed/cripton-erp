import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../components/button.dart';
import '../../../../../../config/app_assets.dart';
import '../../../../../../utils/color.dart';
import '../controllers/my_approval_controller.dart';
import '../models/my_approval.dart';

class MyApprovalView extends GetView<MyApprovalController> {
  const MyApprovalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.buildContext = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SSP Approval'),
        centerTitle: true,
        actions: [
          Obx(() => Visibility(
                visible: !(controller.isSelecting.value),
                child: InkWell(
                    onTap: () {
                      controller.onTapFilterIcon();
                    },
                    child: const Image(
                        height: 20, image: AssetImage(AppAssets.FILTER_ICON))),
              )),
          Obx(() => Visibility(
                visible: controller.isSelecting.value,
                child: InkWell(
                    onTap: () {
                      controller.selectOrDeselectAll();
                    },
                    child: Image(
                        height: 20,
                        image: AssetImage(controller.isAllSelected()
                            ? AppAssets.DESELECT_ALL_ICON
                            : AppAssets.SELECT_ALL_ICON))),
              )),
          const SizedBox(width: 20)
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => RefreshIndicator(
              onRefresh: () async {
                controller.getMyApproval();
              },
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: controller.scrollController,
                      itemCount: controller.myApprovalList.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        MyApprovalModel model =
                            controller.myApprovalList.value[index];
                        return InkWell(
                          onTap: controller.isSelecting.value
                              ? () {
                                  // on Selection Mode
                                  controller
                                      .itemSelectionForBulkApproveOrRejection(
                                          model);
                                }
                              : () {
                                  // Normal Mode
                                  controller.onClickSSPApprovalListItem(
                                      model: model, index: index);
                                },
                          onLongPress: () {
                            controller
                                .itemSelectionForBulkApproveOrRejection(model);
                          },
                          child: Card(
                            color: getColorAsRequisition(
                                reqDocName: model.reqDocName ?? ''),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '#${model.reqNum}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${model.reqDocName}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            model.requesterName ?? '',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            'Emp. ID: ${model.empId}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                    height: 64,
                                    width: 4,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Date: ${model.reqDate?.split(' ')[0]}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            'Status: ${model.status}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Visibility(
                                            // visible: model.isSelected,
                                            visible: controller
                                                .isContainingInSelectedList(
                                                    model),
                                            child: const Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: controller.isSelecting.value,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrimaryButton(
                              onPressed: () {
                                controller.bulkReject();
                              },
                              text: controller
                                  .getNameAsSelectedItemLength('Reject All')),
                          const SizedBox(width: 10),
                          PrimaryButton(
                              onPressed: () {
                                controller.bulkApprove();
                              },
                              text: controller
                                  .getNameAsSelectedItemLength('Approve All')),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
