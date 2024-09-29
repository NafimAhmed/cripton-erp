import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/erp_menu_data.dart';
import '../../../../models/menu.dart';
import '../controllers/ssp_controller.dart';

class SspView extends GetView<SspController> {
  const SspView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Self Service Portal'),
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
                  itemCount: sspMenus.length,
                  itemBuilder: (context, position) {
                    MenuModel menuModel = sspMenus[position];
                    return InkWell(
                      onTap: () {
                        controller.onClickSSPItem(menuModel: menuModel);
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
                            Text(menuModel.titile)
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
