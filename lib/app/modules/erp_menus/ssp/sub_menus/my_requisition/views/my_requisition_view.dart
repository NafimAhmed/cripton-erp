import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../components/timeline.dart';
import '../../../../../../config/app_assets.dart';
import '../../../../../../models/timeline.dart';
import '../../../../../../utils/color.dart';
import '../controllers/my_requisition_controller.dart';
import '../models/my_requisition.dart';

class MyRequisitionView extends GetView<MyRequisitionController> {
  const MyRequisitionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.buildContext = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Requisitions'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: controller.onTapFilterIcon,
            child: const Image(
                height: 20,
                image: AssetImage(
                  AppAssets.FILTER_ICON,
                )),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            controller.getMyRequisition();
          },
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 10),
            itemCount: controller.myRequisitionList.value.length,
            controller: controller.scrollController,
            itemBuilder: (BuildContext context, int index) {
              MyRequisitionModel myRequisitionModel =
                  controller.myRequisitionList.value[index];

              List<TimelineModel> timelineItemList = [];
              controller.myRequisitionList.value[index].approvalFlows
                  ?.approvalFlowList
                  ?.forEach((approvalFlow) {
                timelineItemList.add(
                  TimelineModel(
                    title: approvalFlow.approverLevel ?? 'Level not found',
                    status: approvalFlow.status ?? 'Approve',
                  ),
                );
              });

              return InkWell(
                onTap: () {
                  controller.onClickPreview(myRequisitionModel);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 180,
                  color: getColorAsRequisition(
                      reqDocName: myRequisitionModel.reqDocName ?? ''),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ============================================ Requsition type indigo box ============================================//
                      Container(
                        color: Colors.indigo,
                        width: 30,
                        padding: const EdgeInsets.all(05),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            '${myRequisitionModel.reqDocType}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),

                      //================================================ Main Content ================================================//
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    myRequisitionModel.reqDate ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '# ${myRequisitionModel.reqNum}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${myRequisitionModel.approvalFlows?.approvalPendingMessage}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      '${myRequisitionModel.reqStatus}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              PrimaryTimeLine(
                                height: 100,
                                timelineItemList: timelineItemList,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
