import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/erp_menu_data.dart';
import '../../../../models/menu.dart';
import '../controllers/hris_controller.dart';

class HrisView extends GetView<HrisController> {
  const HrisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Human Resources Information System'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: hrisMenus.length,
                  itemBuilder: (context, position) {
                    MenuModel menuModel = hrisMenus[position];
                    return InkWell(
                      onTap: () {
                        controller.onClickHRISMenu(menuModel: menuModel);
                      },
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 64,
                              image: AssetImage(menuModel.icon),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              menuModel.titile,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
