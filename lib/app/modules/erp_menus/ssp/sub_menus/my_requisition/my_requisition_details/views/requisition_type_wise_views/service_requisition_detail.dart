import 'package:flutter/material.dart';

import '../../../../../../../../components/single_row_item.dart';
import '../../../../../../../../components/timeline.dart';
import '../../../../../../../../models/timeline.dart';
import '../../../../../../../../utils/color.dart';
import '../../../../my_approval/ssp_approval_details/model/service_requisition_detail.dart';
import '../../../models/my_requisition.dart';

class ServiceRequisitionDetailView extends StatelessWidget {
  const ServiceRequisitionDetailView({
    super.key,
    required this.myRequisitionModel,
    required this.serviceRequisitionDetailModel,
  });
  final MyRequisitionModel myRequisitionModel;
  final ServiceRequisitionDetailModel? serviceRequisitionDetailModel;
  @override
  Widget build(BuildContext context) {
    Color titleColor = PRIMARY_LIGHT_COLOR;
    Color titleTextColor = PRIMARY_COLOR;
    TextStyle headerTextStyle = TextStyle(
      fontSize: 16,
      color: titleTextColor,
      fontWeight: FontWeight.bold,
    );
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //***************************************** Header Card ********************************************************* */
            Container(
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  border: Border.all(color: titleColor, width: 5)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Req Ref: ${myRequisitionModel.reqReference ?? ''}',
                        style: headerTextStyle),
                    Text('Req Date: ${myRequisitionModel.reqDate ?? ''}',
                        style: headerTextStyle),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            //***************************************** Person Info Card ********************************************************* */

            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 40,
                    color: titleColor,
                    child: Center(
                      child: Text(
                        'Request For',
                        style: TextStyle(
                          fontSize: 16,
                          color: titleTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${myRequisitionModel.requesterName ?? ''}, ${myRequisitionModel.requesterDesi ?? ''}',
                        ),
                        Text(myRequisitionModel.reqDepName ?? ''),
                        Text(myRequisitionModel.requesterComName ?? ''),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            //***************************************** Details Card ********************************************************* */

            Card(
              color: INDIGO_50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 40,
                    color: titleColor,
                    child: Center(
                      child: Text(
                        'Requisition Items',
                        style: TextStyle(
                          fontSize: 16,
                          color: titleTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: serviceRequisitionDetailModel?.itemList != null
                        ? ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                serviceRequisitionDetailModel?.itemList?.length,
                            itemBuilder: (context, index) {
                              ItemModel itemModel =
                                  serviceRequisitionDetailModel
                                          ?.itemList?[index] ??
                                      ItemModel();
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      SingleRowItem(
                                          title: 'SL', value: '${index + 1}'),
                                      const Divider(),
                                      SingleRowItem(
                                          title: 'Item Name',
                                          value: itemModel.appItemName ?? ''),
                                      const Divider(),
                                      SingleRowItem(
                                          title: 'Justification',
                                          value: itemModel.justification ?? ''),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),

            //***************************************** STATUS Card ********************************************************* */

            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 40,
                    color: titleColor,
                    child: Center(
                        child: Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 16,
                        color: titleTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: PrimaryTimeLine(
                        havingOppositeContent: true,
                        timelineItemList: serviceRequisitionDetailModel
                                ?.approvalFlowList
                                ?.map((element) => TimelineModel(
                                    topTitle: element.approverName ?? '',
                                    color: titleTextColor,
                                    title: element.approverDesi ?? '',
                                    status: element.status ?? ''))
                                .toList() ??
                            []),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            //***************************************** Comment History ********************************************************* */

            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 40,
                    color: titleColor,
                    child: Center(
                        child: Text(
                      'Comment History',
                      style: TextStyle(
                        fontSize: 16,
                        color: titleTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  serviceRequisitionDetailModel?.commentList != null
                      ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: serviceRequisitionDetailModel
                                ?.commentList?.length,
                            itemBuilder: (BuildContext context, int index) {
                              CommentModel? commentModel =
                                  serviceRequisitionDetailModel
                                      ?.commentList![index];
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        commentModel?.comtUserName ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        commentModel?.comtUserDesignation ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const Divider(),
                                      Text(
                                        commentModel?.comments ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),
                ],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
