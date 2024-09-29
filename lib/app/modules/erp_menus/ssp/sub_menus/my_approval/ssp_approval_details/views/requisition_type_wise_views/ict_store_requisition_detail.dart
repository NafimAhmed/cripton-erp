import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';

import '../../../../../../../../components/button.dart';
import '../../../../../../../../components/dropdown_search.dart';
import '../../../../../../../../components/single_row_item.dart';
import '../../../../../../../../components/text_form_field.dart';
import '../../../../../../../../components/timeline.dart';
import '../../../../../../../../models/timeline.dart';
import '../../../../../../../../utils/color.dart';
import '../../../../new_requisition/sub_menus/ict_store_requisition/models/ict_store.dart';
import '../../../models/my_approval.dart';
import '../../controllers/ssp_approval_details_controller.dart';
import '../../model/ict_store_requisition_detail.dart';

class ICTStoreRequisitionDetailView extends StatelessWidget {
  const ICTStoreRequisitionDetailView({
    super.key,
    required this.myApprovalModel,
    required this.ictStoreRequisitionDetailModel,
    required this.controller,
    this.onClickApprove,
    this.onClickReject,
    this.commentController,
  });
  final MyApprovalModel myApprovalModel;
  final ICTStoreRequisitionDetailModel? ictStoreRequisitionDetailModel;
  final VoidCallback? onClickApprove;
  final VoidCallback? onClickReject;
  final TextEditingController? commentController;
  final SspApprovalDetailsController controller;
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
                    Text('Ref: ${myApprovalModel.reqReference ?? ''}',
                        style: headerTextStyle),
                    Text(myApprovalModel.reqComReference ?? '',
                        style: headerTextStyle),
                    Text(myApprovalModel.reqDate ?? '', style: headerTextStyle),
                    Text('Revision: ${myApprovalModel.revision ?? ''}',
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
                          '${myApprovalModel.requesterName ?? ''}, ${myApprovalModel.requesterDesi ?? ''}',
                        ),
                        Text(myApprovalModel.reqDepName ?? ''),
                        Text(myApprovalModel.requesterComName ?? ''),
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
                    padding: const EdgeInsets.all(10),
                    child: ictStoreRequisitionDetailModel?.itemList != null
                        ? ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: ictStoreRequisitionDetailModel
                                ?.itemList?.length,
                            itemBuilder: (context, index) {
                              ItemModel itemModel =
                                  ictStoreRequisitionDetailModel
                                          ?.itemList?[index] ??
                                      ItemModel();
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      SingleRowItem(
                                          title: 'SL',
                                          value: (index + 1).toString()),
                                      const Divider(),
                                      InkWell(
                                        onTap: () {
                                          showUpdateItemWidge(index);
                                        },
                                        child: SingleRowItem(
                                          title: 'Item Name',
                                          value: itemModel.appItemName ?? '',
                                          valueTextStyle: const TextStyle(
                                              color: Colors.blue),
                                        ),
                                      ),
                                      const Divider(),
                                      SingleRowItem(
                                          title: 'Justification',
                                          value: itemModel.justification ?? ''),
                                      const Divider(),
                                      SingleRowItem(
                                          title: 'Requisition Quantity',
                                          value:
                                              '${itemModel.reqItemQty ?? 0} ${itemModel.appItemUnit}'),
                                      const Divider(),
                                      InkWell(
                                        onTap: () {
                                          showItemQuantity(index);
                                        },
                                        child: SingleRowItem(
                                          title: 'Approve Quantity',
                                          value:
                                              '${itemModel.appItemQty} ${itemModel.appItemUnit}',
                                          valueTextStyle: const TextStyle(
                                              color: Colors.blue),
                                        ),
                                      ),
                                      const Divider(),
                                      SingleRowItem(
                                          title: 'Stock',
                                          value:
                                              '${itemModel.stkQty} ${itemModel.appItemUnit}'),
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
                        timelineItemList: ictStoreRequisitionDetailModel
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
            //*********************************************** Comment History Card ********************************************************* */

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
                  ictStoreRequisitionDetailModel?.commentList != null
                      ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: ictStoreRequisitionDetailModel
                                ?.commentList?.length,
                            itemBuilder: (BuildContext context, int index) {
                              CommentModel? commentModel =
                                  ictStoreRequisitionDetailModel
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
            //*********************************************** Action Section ********************************************************* */

            controller.showAction
                ? SecondaryTextFormField(
                    label: 'Comment',
                    controller: commentController,
                  )
                : const SizedBox(),
            controller.showAction
                ? const SizedBox(height: 10)
                : const SizedBox(),
            controller.showAction
                ? Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          onPressed: onClickReject ?? () {},
                          text: 'Reject',
                          height: 40,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: PrimaryButton(
                          onPressed: onClickApprove ?? () {},
                          text: 'Approve',
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  //=============================================================== Update Widgets=============================================//
  showUpdateItemWidge(int itemIndex) async {
    ItemModel itemModel =
        ictStoreRequisitionDetailModel?.itemList?[itemIndex] ?? ItemModel();
    ICTStoreModel? selectedIctStoreModel;
    return Get.bottomSheet(Container(
      height: Get.height / 2,
      width: Get.width,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      child: Column(children: [
        SingleRowItem(
          title: 'Previous Item Name',
          titleTextStyle: const TextStyle(fontSize: 18),
          valueTextStyle: const TextStyle(fontSize: 18),
          value: '${itemModel.appItemName}',
        ),
        const SizedBox(height: 10),
        PaginatedSearchableDropDown<ICTStoreModel>(
          hintText: 'Select Product',
          paginatedRequest: (int page, String? searchKey) async {
            final list = await controller.getICTStoreProductList(
                page: page, searchKey: searchKey);
            return list
                .map((element) => SearchableDropdownMenuItem<ICTStoreModel>(
                    value: element,
                    label: element.toString(),
                    child: Text(element.toString())))
                .toList();
          },
          onChanged: (ictStoreModel) {
            selectedIctStoreModel = ictStoreModel;
          },
        ),
        const Expanded(child: SizedBox(height: 10)),
        Row(
          children: [
            Expanded(
                child: SecondaryButton(
                    onPressed: () {
                      Get.back();
                    },
                    text: 'Cancel')),
            const SizedBox(width: 10),
            Expanded(
                child: PrimaryButton(
                    height: 20,
                    onPressed: () {
                      itemModel.appItemName =
                          selectedIctStoreModel?.productName;
                      itemModel.appItemID = selectedIctStoreModel?.id;
                      controller.ictStoreRequisitionDeatailsModel.value
                          ?.itemList?[itemIndex] = itemModel;
                      controller.ictStoreRequisitionDeatailsModel.refresh();
                      Get.back();
                    },
                    text: 'Change')),
          ],
        ),
      ]),
    ));
  }

  showItemQuantity(int itemIndex) async {
    ItemModel itemModel =
        ictStoreRequisitionDetailModel?.itemList?[itemIndex] ?? ItemModel();
    TextEditingController quantityController = TextEditingController();
    return Get.bottomSheet(Container(
      height: Get.height / 2,
      width: Get.width,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      child: Column(children: [
        SingleRowItem(
          title: 'Previous Quantity',
          titleTextStyle: const TextStyle(fontSize: 18),
          valueTextStyle: const TextStyle(fontSize: 18),
          value: '${itemModel.appItemQty}',
        ),
        const SizedBox(height: 10),
        SecondaryTextFormField(
          label: 'Quantity',
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
          ],
          controller: quantityController,
          keyboardType: TextInputType.number,
        ),
        const Expanded(child: SizedBox(height: 10)),
        Row(
          children: [
            Expanded(
                child: SecondaryButton(
                    onPressed: () {
                      Get.back();
                    },
                    text: 'Cancel')),
            const SizedBox(width: 10),
            Expanded(
                child: PrimaryButton(
                    height: 20,
                    onPressed: () {
                      itemModel.appItemQty = quantityController.text;
                      controller.ictStoreRequisitionDeatailsModel.value
                          ?.itemList?[itemIndex] = itemModel;

                      controller.ictStoreRequisitionDeatailsModel.refresh();
                      // quantityController.dispose();
                      Get.back();
                    },
                    text: 'Change')),
          ],
        ),
      ]),
    ));
  }
}
