import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/button.dart';
import '../../../../components/text_form_field.dart';
import '../../../../config/app_assets.dart';
import '../../../../utils/color.dart';
import '../controllers/api_config_controller.dart';

class ApiConfigView extends GetView<ApiConfigController> {
  const ApiConfigView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Server Config'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Form(
            key: controller.ipPortConfigKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Image(
                  height: 160,
                  width: 160,
                  image: AssetImage(
                    AppAssets.APP_TRANSPARENT_LOGO,
                  ),
                ),
                const SizedBox(height: 64),
                SecondaryTextFormField(
                  label: 'Data server start point',
                  controller: controller.ipPortController,
                  hint: 'http://0.0.0.0:0000',
                  validationText: 'Data server start point is required',
                ),
                const SizedBox(height: 20),
                SecondaryTextFormField(
                  label: 'Image Server PATH',
                  hint: '/Folder/',
                  controller: controller.imageServerPathController,
                  validationText: 'Image Server PATH is required',
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  onPressed: controller.onClickSave,
                  text: 'SAVE',
                ),
                const SizedBox(height: 80),
                const Text(
                  'Powered by',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: PRIMARY_COLOR),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Pakiza Software Limited',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: PRIMARY_COLOR),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
