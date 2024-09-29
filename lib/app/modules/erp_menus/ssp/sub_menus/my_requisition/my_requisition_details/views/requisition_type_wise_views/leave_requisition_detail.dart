import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/single_row_item.dart';
import '../../../../../../../../components/timeline.dart';
import '../../../../../../../../config/api_constant.dart';
import '../../../../../../../../models/timeline.dart';
import '../../../../../../../../routes/app_pages.dart';
import '../../../../../../../../utils/color.dart';
import '../../../../../../../../utils/icon.dart';
import '../../../../../../../../utils/pdf.dart';
import '../../../../../../../../utils/snackbar.dart';
import '../../../../my_approval/ssp_approval_details/model/leave_requisition_detail.dart';
import '../../../models/my_requisition.dart';

class LeaveRequisitiontionDeatils extends StatelessWidget {
  const LeaveRequisitiontionDeatils(
      {super.key,
      required this.myRequisitionModel,
      required this.leaveRequisitionDetailModel});

  final MyRequisitionModel myRequisitionModel;
  final LeaveRequisitionDetailModel? leaveRequisitionDetailModel;
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 40,
                    color: titleColor,
                    child: Center(
                        child: Text(
                      'Requisition Details',
                      style: TextStyle(
                        fontSize: 16,
                        color: titleTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SingleRowItem(
                          title: 'Type',
                          value: leaveRequisitionDetailModel?.lvTypeName ?? '',
                          valueTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                        const SingleRowItem(
                            title: 'Category', value: 'Full Day Leave'),
                        const Divider(),
                        SingleRowItem(
                            title: 'From',
                            value: leaveRequisitionDetailModel?.reqLeaveFrom ??
                                ''),
                        const Divider(),
                        SingleRowItem(
                            title: 'To',
                            value:
                                leaveRequisitionDetailModel?.reqLeaveTo ?? ''),
                        const Divider(),
                        SingleRowItem(
                            title: 'Duration',
                            value:
                                '${leaveRequisitionDetailModel?.reqLeaveDays ?? ''} Days'),
                        const Divider(),
                        SingleRowItem(
                            title: 'Purpose',
                            value: leaveRequisitionDetailModel?.leavePurpose ??
                                ''),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(child: Text('Documents')),
                            const Text(': '),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      String leaveDocPath =
                                          leaveRequisitionDetailModel
                                                  ?.leaveDocPath ??
                                              '';
                                      String leaveDocUrl =
                                          '${ApiConstant.SERVER_IP_PORT}$leaveDocPath';
                                      if (leaveDocPath.isNotEmpty) {
                                        if (isPdf(leaveDocPath)) {
                                          showDownloadedPDF(leaveDocUrl);
                                        } else {
                                          Get.toNamed(Routes.FILE_PREVIEW,
                                              arguments: leaveDocUrl);
                                        }
                                      } else {
                                        showWarningSnackkbar(
                                            message: 'No file available');
                                      }
                                    },
                                    child: Image(
                                        height: 24,
                                        width: 24,
                                        image: AssetImage(getIconPathAsDocType(
                                            leaveRequisitionDetailModel
                                                    ?.leaveDocPath ??
                                                ''))),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Divider(),
                        SingleRowItem(
                            title: 'Address',
                            value: leaveRequisitionDetailModel?.leaveAddress ??
                                ''),
                        const Divider(),
                        SingleRowItem(
                            title: 'Contact',
                            value: leaveRequisitionDetailModel?.leaveContact ??
                                ''),
                        const Divider(),
                        SingleRowItem(
                            title: 'Responsible',
                            value:
                                leaveRequisitionDetailModel?.responsibleName ??
                                    ''),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),

            //***************************************** Status Card ********************************************************* */

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
                        timelineItemList: leaveRequisitionDetailModel
                                ?.approvalFlowList
                                ?.map((element) => TimelineModel(
                                    color: titleTextColor,
                                    topTitle: element.approverName ?? '',
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
                  leaveRequisitionDetailModel?.comments != null
                      ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount:
                                leaveRequisitionDetailModel?.comments?.length,
                            itemBuilder: (BuildContext context, int index) {
                              CommentModel? commentModel =
                                  leaveRequisitionDetailModel?.comments![index];
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
