import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/requisition_menu_data.dart';
import '../../../../../../models/menu.dart';
import '../controllers/new_requisition_controller.dart';

class NewRequisitionView extends GetView<NewRequisitionController> {
  const NewRequisitionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Requisition'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: requisitionMenuData.length,
          itemBuilder: (context, index) {
            MenuModel requisitionMenuModel = requisitionMenuData[index];
            return InkWell(
              onTap: () {
                controller.onTapNewRequisitionMenuItem(requisitionMenuModel);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Image(image: AssetImage(requisitionMenuModel.icon)),
                      const SizedBox(width: 20),
                      Expanded(
                          flex: 1, child: Text(requisitionMenuModel.titile)),
                      const Icon(Icons.arrow_forward_ios, size: 16)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
