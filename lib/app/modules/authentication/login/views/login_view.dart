import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/button.dart';
import '../../../../components/text_form_field.dart';
import '../../../../config/app_assets.dart';
import '../../../../utils/color.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Form(
            key: controller.loginFormKey,
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
                LoginTextFormField(
                  prefixIcon: Icons.person,
                  label: 'User Id',
                  controller: controller.userIdController,
                  obscureText: false,
                  validationText: 'User id is required',
                ),
                const SizedBox(height: 20),
                Obx(() => LoginTextFormField(
                      prefixIcon: Icons.lock,
                      label: 'Password',
                      controller: controller.passwordController,
                      obscureText: controller.obscureText.value,
                      validationText: 'Password is required',
                      suffixIconButton: IconButton(
                          onPressed: () {
                            controller.obscureText.value =
                                !controller.obscureText.value;
                          },
                          icon: Icon(
                            controller.obscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                    )),
                const SizedBox(height: 20),
                PrimaryButton(
                  onPressed: () {
                    //Get.offAllNamed(Routes.HOME);
                    controller.onPressedLogin();
                  },
                  text: 'LOGIN',
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: controller.onClickSetting,
                      icon: const Icon(
                        Icons.settings,
                        color: PRIMARY_COLOR,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 64),
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
      )),
    );
  }
}
