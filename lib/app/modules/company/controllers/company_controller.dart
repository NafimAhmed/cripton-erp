import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/login_creadential.dart';
import '../../../models/api_response.dart';
import '../../../models/user.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_communication.dart';
import '../models/organization.dart';
import '../models/region.dart';

class CompanyController extends GetxController {
  final GlobalKey<FormState> companyFormKey = GlobalKey();
  late ApiCommunication _apiCommunication;
  late LoginCredential credential;
  late final UserModel user;

  Rx<List<OrganizationModel>> organizationList = Rx([]);
  Rx<OrganizationModel?> selectedOrganization = Rx(null);
  Rx<List<RegionModel>> regionList = Rx([]);
  Rx<RegionModel?> selectedRegion = Rx(null);

  void onPressSubmit() {
    if (companyFormKey.currentState!.validate()) {
      user.organizationShortName = selectedOrganization.value?.compShortName;
      user.regionShortName = selectedRegion.value?.shortName;
      user.organizationId = selectedOrganization.value?.id;
      user.regionId = selectedRegion.value?.id;
      credential.saveUserData(user);
      Get.offNamed(Routes.HOME);
    }
  }

  getOrganization() async {
    final ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Organization/GetAllHrOrginationRecord',
      requestData: {},
    );
    if (response.isSuccessful) {
      List data = response.data as List;
      organizationList.value = data
          .map((element) =>
              OrganizationModel.fromMap(element as Map<String, dynamic>))
          .toList();
      for (OrganizationModel organizationModel in organizationList.value) {
        if (organizationModel.id == user.organizationId) {
          selectedOrganization.value = organizationModel;
        }
      }
    }
  }

  getRegions({String? organizationId}) async {
    final ApiResponse response;
    selectedRegion.value = null;
    if (organizationId == null) {
      // Geting regions as selected organization
      response = await _apiCommunication.doPostRequest(
        apiEndPoint:
            'Organization/GetAllHrRegionRecord?orginationId=${selectedOrganization.value?.id}',
      );
    } else {
      // Getting regions as user default regions
      response = await _apiCommunication.doPostRequest(
          apiEndPoint:
              'Organization/GetAllHrRegionRecord?orginationId=$organizationId');
    }
    if (response.isSuccessful) {
      List data = response.data as List;
      regionList.value = data
          .map(
              (element) => RegionModel.fromMap(element as Map<String, dynamic>))
          .toList();
      /* If user current region matches any item in region list 
       * set that value by default.
       */
      for (RegionModel regionModel in regionList.value) {
        if (regionModel.id == user.regionId) {
          selectedRegion.value = regionModel;
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    credential = LoginCredential();
    user = credential.getUserData();
    _apiCommunication = ApiCommunication();
    getOrganization();
    getRegions(organizationId: user.organizationId);
  }

  @override
  void onClose() {
    super.onClose();
    _apiCommunication.endConnection();
  }
}
