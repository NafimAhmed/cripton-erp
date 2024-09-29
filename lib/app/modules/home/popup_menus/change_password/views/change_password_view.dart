import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/button.dart';
import '../../../../../components/text_form_field.dart';
import '../../../../../utils/color.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.changePasswordFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Icon(
                  Icons.lock,
                  size: 128,
                  color: PRIMARY_COLOR,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Update Your Password Here',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 40),
                Obx(() => LoginTextFormField(
                      prefixIcon: Icons.lock,
                      fillColor: Colors.white,
                      label: 'Current Password',
                      focusNode: controller.currentPasswordFocusNode,
                      controller: controller.currentPasswordController,
                      obscureText: controller.currentObscureText.value,
                      validationText: 'Current password is required',
                      suffixIconButton: IconButton(
                          onPressed: () {
                            controller.currentObscureText.value =
                                !controller.currentObscureText.value;
                          },
                          icon: Icon(
                            controller.currentObscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                    )),
                const SizedBox(height: 10),
                Obx(() => LoginTextFormField(
                      fillColor: Colors.white,
                      obscureText: controller.newObscureText.value,
                      prefixIcon: Icons.lock,
                      label: 'New Password',
                      controller: controller.newPasswordController,
                      focusNode: controller.newPasswordFocusNode,
                      validationText: 'New password is required',
                      suffixIconButton: IconButton(
                          onPressed: () {
                            controller.newObscureText.value =
                                !controller.newObscureText.value;
                          },
                          icon: Icon(
                            controller.newObscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                    )),
                const SizedBox(height: 10),
                Obx(() => LoginTextFormField(
                      fillColor: Colors.white,
                      obscureText: controller.confirmObscureText.value,
                      prefixIcon: Icons.lock,
                      label: 'Confirm Password',
                      controller: controller.confirmPasswordController,
                      focusNode: controller.confirmPasswordFocusNode,
                      validationText: 'Confirm password is required',
                      suffixIconButton: IconButton(
                          onPressed: () {
                            controller.confirmObscureText.value =
                                !controller.confirmObscureText.value;
                          },
                          icon: Icon(
                            controller.confirmObscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                    )),
                const SizedBox(height: 20),
                PrimaryButton(
                    onPressed: () {
                      controller.changePassword();
                    },
                    text: 'SUBMIT')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
