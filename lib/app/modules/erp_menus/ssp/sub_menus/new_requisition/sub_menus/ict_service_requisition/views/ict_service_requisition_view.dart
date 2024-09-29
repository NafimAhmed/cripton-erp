import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/button.dart';
import '../../../../../../../../components/dropdown_search.dart';
import '../../../../../../../../components/text_form_field.dart';
import '../../../../../../../../utils/color.dart';
import '../../../../../../../../utils/snackbar.dart';
import '../controllers/ict_service_requisition_controller.dart';
import '../model/ict_service_item.dart';

class IctServiceRequisitionView
    extends GetView<IctServiceRequisitionController> {
  const IctServiceRequisitionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isKeybordOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        appBar: AppBar(
          title: const Text('ICT Service Requisition'),
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
                      'Product/Item',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PRIMARY_COLOR,
                      ),
                    ),
                    Form(
                      key: controller.servciceRequisitionFormKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Obx(() => SecondaryDropdownSearch(
                                validationText: 'Product is required',
                                selectedItem:
                                    controller.selectedIctServicesModel.value,
                                list: controller.ictServiceItemList,
                                onChanged: (generalStoreProductModel) {
                                  if (generalStoreProductModel?.id != null) {
                                    controller.selectedIctServicesModel.value =
                                        generalStoreProductModel;
                                  } else {
                                    showWarningSnackkbar(
                                      titile: 'This product can not be added',
                                      message: 'Product id is null',
                                    );
                                  }
                                },
                                hint: 'Select Product',
                              )),
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
                              controller.addICTServicesForRequisition(context);
                            },
                            text: 'Add Product',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    Obx(() => ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: controller.addedServiceList.length,
                        itemBuilder: (context, index) {
                          ICTServiceItemModel productItemModel =
                              controller.addedServiceList[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Expanded(
                                            child: Text('Product Name'),
                                          ),
                                          const Text(': '),
                                          Expanded(
                                              child: Text(
                                                  productItemModel.productName ?? ''))
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Expanded(
                                            child: Text('Justification'),
                                          ),
                                          const Text(': '),
                                          Expanded(
                                              child: Text(
                                                  productItemModel.justification ??
                                                      ''))
                                        ],
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
                        controller.addedServiceList.isNotEmpty),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: PrimaryButton(
                          height: 40,
                          onPressed: () {
                            controller.submitICTServiceRequisition();
                            FocusScope.of(context).unfocus();
                          },
                          text: 'Submit'),
                    ),
                  ))
            ],
          ),
        ));
  }
}
