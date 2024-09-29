import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/button.dart';
import '../../../../../../../../components/dropdown.dart';
import '../../../../../../../../components/dropdown_search.dart';
import '../../../../../../../../components/text_form_field.dart';
import '../../../../../../../../models/menu.dart';
import '../../../../../../../../utils/date_time.dart';
import '../controllers/leave_requisition_controller.dart';
import '../models/leave_category.dart';
import '../models/leave_type.dart';

class LeaveRequisitionView extends GetView<LeaveRequisitionController> {
  const LeaveRequisitionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Current Route Menu
    MenuModel? menuModel = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(menuModel?.titile ?? 'Leave Requisition'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: controller.leaveRequisitionFormKey,
                child: Column(
                  children: [
                    Obx(() => SecondaryDropDownField(
                          selectedItem: controller.selectedLeaveType.value,
                          validationText: 'Leave type is required',
                          list: controller.leaveTypeList.value,
                          onChanged: (value) {
                            controller.selectedLeaveType.value =
                                value as LeaveTypeModel;
                          },
                          hint: 'Leave Type',
                        )),
                    const SizedBox(height: 10),
                    Obx(() => SecondaryDropDownField(
                          selectedItem: controller.selectedLeaveCategory.value,
                          validationText: 'Leave category is required',
                          list: controller.leaveCategoryList.value,
                          onChanged: (value) {
                            controller.selectedLeaveCategory.value =
                                value as LeaveCategoryModel;
                          },
                          hint: 'Leave Category',
                        )),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ClickableTextFormField(
                            suffixIcon: Icons.date_range,
                            label: 'Start Date',
                            hints: 'DD-MM-YYYY',
                            inputFormatters: [DB_DATE_INPUT_FORMATE],
                            onIconTap: () {
                              controller.onClickStartDateTextFormField(context);
                            },
                            controller: controller.startDateController,
                            validationText: 'Start date is required',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ClickableTextFormField(
                            inputFormatters: [DB_DATE_INPUT_FORMATE],
                            suffixIcon: Icons.date_range,
                            label: 'End Date',
                            hints: 'DD-MM-YYYY',
                            validationText: 'End date is required',
                            onIconTap: () {
                              controller.onClickEndDateTextFormField(context);
                            },
                            controller: controller.endDateController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Obx(() => PrimaryDropdownSearch(
                          selectedItem: controller.selectedHandoberPerson.value,
                          validationText: 'Responsible person is required',
                          list: controller.getHandobertoPersonsList(),
                          onChanged: (handoberPersonModel) {
                            controller.selectedHandoberPerson.value =
                                handoberPersonModel;
                          },
                          hint: 'Select Responsible Person',
                        )),
                    const SizedBox(height: 10),
                    SecondaryTextFormField(
                      label: 'Purpose',
                      hint: 'Describe your purpose to have leave',
                      controller: controller.purposeController,
                      validationText: 'Purpose is required',
                    ),
                    const SizedBox(height: 10),
                    SecondaryTextFormField(
                      label: 'Leave Address',
                      hint: 'Address during leave',
                      controller: controller.addressController,
                      validationText: 'Leave address is required',
                    ),
                    const SizedBox(height: 10),
                    SecondaryTextFormField(
                      label: 'Phone',
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      keyboardType: TextInputType.number,
                      hint: 'Your phone number',
                      controller: controller.phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone number is required';
                        } else {
                          if (value.length > 11 || value.length < 11) {
                            return 'Phone number length must be 11 degit';
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    ClickableTextFormField(
                      controller: controller.attachmentController,
                      label: 'Attachment (jpeg, jpg, png, pdf) 1 mb',
                      onIconTap: controller.uploadLeaveAttachment,
                      suffixIcon: Icons.upload,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        controller.submitleaveRequisition();
                      },
                      text: 'Submit',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
