import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/button.dart';
import '../../../components/dropdown.dart';
import '../../../config/app_assets.dart';
import '../../../utils/color.dart';
import '../controllers/company_controller.dart';
import '../models/organization.dart';
import '../models/region.dart';

class CompanyView extends GetView<CompanyController> {
  const CompanyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Form(
            key: controller.companyFormKey,
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
                Obx(
                  () => SecondaryDropDownField(
                    selectedItem: controller.selectedOrganization.value,
                    hint: 'Select  Organization',
                    list: controller.organizationList.value,
                    onChanged: (value) {
                      controller.selectedOrganization.value =
                          value as OrganizationModel;
                      controller.getRegions();
                    },
                    validationText: 'Organization is required',
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => SecondaryDropDownField(
                    hint: 'Select Region',
                    selectedItem: controller.selectedRegion.value,
                    list: controller.regionList.value,
                    onChanged: (value) {
                      controller.selectedRegion.value = value as RegionModel;
                    },
                    validationText: 'Region is required',
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  onPressed: () {
                    controller.onPressSubmit();
                  },
                  text: 'SUBMIT',
                ),
                const SizedBox(height: 10),
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
