import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../components/image.dart';
import '../../../../components/text_form_field.dart';
import '../../../../utils/color.dart';
import '../controllers/phonebook_controller.dart';
import '../models/contact.dart';

class PhonebookView extends GetView<PhonebookController> {
  const PhonebookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phonebook'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SecondaryTextFormField(
              label: 'Search here',
              suffixIcon: Icons.search,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: controller.contactList.value.length,
              itemBuilder: (BuildContext listViewContext, int index) {
                ContactModel contactModel = controller.contactList.value[index];
                return Slidable(
                  //================================================ Slideable Actions ================================================//
                  startActionPane: ActionPane(
                    extentRatio: 0.25,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (BuildContext context) {
                          debugPrint('onClick Called');
                          controller.onClickMessage(
                              context, '${contactModel.mobile}');
                        },
                        backgroundColor: PRIMARY_COLOR,
                        foregroundColor: Colors.white,
                        icon: Icons.message,
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    extentRatio: 0.25,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (BuildContext context) {
                          controller.onClickCall(
                              context, '${contactModel.mobile}');
                        },
                        backgroundColor: const Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.call,
                      ),
                    ],
                  ),
                  //================================================ Phonebook List Main View ================================================//
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            RoundedNetworkImage(
                              imageUrl: contactModel.photoUrl ?? '',
                              radius: 40,
                              border: 1,
                              borderColor: Colors.grey,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contactModel.empName ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  contactModel.designation ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  contactModel.email ?? '',
                                ),
                                Text(
                                  contactModel.mobile ?? '',
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider()
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
