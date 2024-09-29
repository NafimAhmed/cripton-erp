import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../components/button.dart';
import '../../../../../../components/image.dart';
import '../../../../../../components/single_row_item.dart';
import '../../../../../../utils/color.dart';
import '../controllers/profile_pic_and_signature_controller.dart';

class ProfilePicAndSignatureView
    extends GetView<ProfilePicAndSignatureController> {
  const ProfilePicAndSignatureView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile And Signature Picture'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  textInputAction: TextInputAction.search,
                  controller: controller.employeeIdController,
                  decoration: InputDecoration(
                    hintText: 'Search with employee id',
                    contentPadding:
                        const EdgeInsets.only(left: 20, top: 16, bottom: 16),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    suffixIcon: InkWell(
                      onTap: controller.getEmployeeData,
                      child: const Icon(
                        Icons.search,
                        weight: 4,
                        color: PRIMARY_COLOR,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SingleRowItem(
                              title: 'Name',
                              value: controller.employee.value?.empName ?? ''),
                          const Divider(),
                          SingleRowItem(
                              title: 'Department',
                              value:
                                  controller.employee.value?.deptName ?? 'N/A'),
                          const Divider(),
                          SingleRowItem(
                              title: 'Designation',
                              value:
                                  controller.employee.value?.designation ?? ''),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Image',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            PrimaryNetworkImage(
                              imageUrl:
                                  controller.employee.value?.photoUrl ?? '',
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Signature',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            PrimaryNetworkImage(
                              imageUrl:
                                  controller.employee.value?.signUrl ?? '',
                            ),
                          ],
                        )
                      ],
                    )),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PrimaryButton(
                        onPressed: () {
                          controller.onClickChangePhoto();
                        },
                        text: 'Change'),
                    PrimaryButton(
                        onPressed: () {
                          controller.onClickChangeSignature();
                        },
                        text: 'Change'),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
