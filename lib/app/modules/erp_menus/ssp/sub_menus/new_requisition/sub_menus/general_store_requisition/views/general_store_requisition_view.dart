import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';

import '../../../../../../../../components/button.dart';
import '../../../../../../../../components/dropdown.dart';
import '../../../../../../../../components/dropdown_search.dart';
import '../../../../../../../../components/single_row_item.dart';
import '../../../../../../../../components/text_form_field.dart';
import '../../../../../../../../utils/color.dart';
import '../controllers/general_store_requisition_controller.dart';
import '../model/general_product_model.dart';
import '../model/product_item.dart';
import '../model/uses_purpose.dart';

class GeneralStoreRequisitionView
    extends GetView<GeneralStoreRequisitionController> {
  const GeneralStoreRequisitionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isKeybordOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        appBar: AppBar(
          title: const Text('General Store Requisition'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const Text(
                      'Product For',
                      style: TextStyle(
                        fontSize: 18,
                        color: PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => SecondaryDropDownField(
                        selectedItem: controller.selectedUsesPurposeModel.value,
                        list: controller.usesPurposeList.value,
                        hint: 'Purpose',
                        onChanged: controller.addedProductList.isEmpty
                            ? (model) {
                                controller.selectedUsesPurposeModel.value =
                                    model as UsesPerpousModel;
                              }
                            : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Product/Item',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Form(
                      key: controller.productFormKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          PaginatedSearchableDropDown<GeneralProductModel>(
                            hintText: 'Select Product',
                            paginatedRequest:
                                (int page, String? searchKey) async {
                              final list =
                                  await controller.getgeneralProductItemList(
                                      page: page, searchKey: searchKey);
                              return list
                                  .map((element) => SearchableDropdownMenuItem<
                                          GeneralProductModel>(
                                      value: element,
                                      label: element.toString(),
                                      child: Text(element.toString())))
                                  .toList();
                            },
                            onChanged: (ictStoreModel) {
                              if (ictStoreModel?.id != null) {
                                controller.selectedGeneralStoreProductModel
                                    .value = ictStoreModel;
                              } else {
                                controller.selectedGeneralStoreProductModel
                                    .value = null;
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          SecondaryTextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'))
                            ],
                            controller: controller.quantityController,
                            focusNode: controller.quantityFocusNode,
                            keyboardType: TextInputType.number,
                            label: 'Quantity',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Quantity is required';
                              } else {
                                int quantity = int.parse(value);
                                if (quantity < 10000) {
                                  return null;
                                } else {
                                  return "Quantity can't be greater than 9999";
                                }
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          SecondaryTextFormField(
                            label: 'Justification',
                            controller: controller.justificationController,
                            focusNode: controller.justificationFocusNode,
                            validationText: 'Justification is required',
                          ),
                          const SizedBox(height: 20),
                          PrimaryButton(
                            height: 30,
                            onPressed: () {
                              controller
                                  .addGeneralProductForRequisition(context);
                              FocusScope.of(context).unfocus();
                            },
                            text: 'Add Product',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    Obx(() => ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: controller.addedProductList.length,
                        itemBuilder: (context, index) {
                          ProductItemModel productItemModel =
                              controller.addedProductList[index];
                          return Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(children: [
                                      RequisitionSingleRowItem(
                                        title: 'Product Name',
                                        value:
                                            productItemModel.productName ?? '',
                                      ),
                                      const SizedBox(height: 10),
                                      RequisitionSingleRowItem(
                                        title: 'Product Quantity',
                                        value:
                                            productItemModel.reqItemQty ?? '',
                                      ),
                                      const SizedBox(height: 10),
                                      RequisitionSingleRowItem(
                                        title: 'Justification',
                                        value: productItemModel.justification ??
                                            '',
                                      ),
                                    ]),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.removeProduct(index);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Obx(() => Visibility(
                    visible: (!isKeybordOpen &&
                        controller.addedProductList.isNotEmpty),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: PrimaryButton(
                          height: 40,
                          onPressed: () {
                            controller.submitGeneralStoreRequisition();
                          },
                          text: 'Submit'),
                    ),
                  ))
            ],
          ),
        ));
  }
}
