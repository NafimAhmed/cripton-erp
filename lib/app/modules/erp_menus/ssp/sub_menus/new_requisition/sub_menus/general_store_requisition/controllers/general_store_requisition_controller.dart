import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../models/api_response.dart';
import '../../../../../../../../services/api_communication.dart';
import '../../../../../../../../utils/snackbar.dart';
import '../../../../../../../home/controllers/home_controller.dart';
import '../model/general_product_model.dart';
import '../model/product_item.dart';
import '../model/uses_purpose.dart';

class GeneralStoreRequisitionController extends GetxController {
  late ApiCommunication _apiCommunication;
  late TextEditingController quantityController;
  late TextEditingController justificationController;
  late FocusNode quantityFocusNode;
  late FocusNode justificationFocusNode;
  final GlobalKey<FormState> productFormKey = GlobalKey();
  //Product For
  Rx<List<UsesPerpousModel>> usesPurposeList = Rx<List<UsesPerpousModel>>([]);
  Rx<UsesPerpousModel?> selectedUsesPurposeModel = Rx(null);
  //Product Item For adding
  RxList<GeneralProductModel> generalProductItemList = RxList([]);
  Rx<GeneralProductModel?> selectedGeneralStoreProductModel = Rx(null);
  //Added Product
  RxList<ProductItemModel> addedProductList = RxList([]);

  Future getUsesPurposeList() async {
    ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Requisition/GetListOfPurposeOfUse',
    );
    usesPurposeList.value = (response.data as List)
        .map((element) =>
            UsesPerpousModel.fromMap(element as Map<String, dynamic>))
        .toList();
  }

  Future<List<GeneralProductModel>> getgeneralProductItemList(
      {required int page, String? searchKey}) async {
    ApiResponse response = await _apiCommunication.doPostRequest(
        apiEndPoint: 'Requisition/GetGeneralStoreProducts',
        requestData: {
          'rowIndex': (page - 1) * 20,
          'pageSize': 20,
          'searchContext': searchKey,
        });
    generalProductItemList.value = (response.data as List)
        .map((element) =>
            GeneralProductModel.fromMap(element as Map<String, dynamic>))
        .toList();

    return generalProductItemList;
  }

  bool isProductValidatedForAddingForRequisition() {
    if (selectedUsesPurposeModel.value != null) {
      if (selectedGeneralStoreProductModel.value != null) {
        if (productFormKey.currentState!.validate()) {
          return true;
        } else {
          return false;
        }
      } else {
        showWarningSnackkbar(message: 'Please select product');
        return false;
      }
    } else {
      showWarningSnackkbar(message: 'Please select the purpose first');
      return false;
    }
  }

  void addGeneralProductForRequisition(BuildContext context) {
    if (isProductValidatedForAddingForRequisition()) {
      if (!isProductAlreadyAdded()) {
        addedProductList.add(
          ProductItemModel(
            productName: selectedGeneralStoreProductModel.value?.productName,
            reqItemId: selectedGeneralStoreProductModel.value?.id,
            justification: justificationController.text,
            reqItemQty: quantityController.text,
          ),
        );
      } else {
        showErrorSnackkbar(message: 'Product already added');
      }

      justificationController.clear();
      quantityController.clear();
      justificationFocusNode.unfocus();
      quantityFocusNode.unfocus();
      FocusScope.of(context).unfocus();
    } else {}
  }

  bool isProductAlreadyAdded() {
    for (ProductItemModel addedProduct in addedProductList) {
      if (addedProduct.reqItemId ==
          selectedGeneralStoreProductModel.value?.id) {
        return true;
      }
    }
    return false;
  }

  void removeProduct(int index) {
    addedProductList.removeAt(index);
    addedProductList.refresh();
  }

  submitGeneralStoreRequisition() async {
    if (addedProductList.isNotEmpty) {
      final ApiResponse response = await _apiCommunication.doPostRequest(
        apiEndPoint: 'Requisition/SaveSSPStoreRequisition',
        responseDataKey: 'data',
        requestData: {
          'items': [
            for (ProductItemModel productModel in addedProductList)
              {
                'purpose': selectedUsesPurposeModel.value?.useValue ?? '',
                'productId': productModel.reqItemId,
                'reqQuantity': productModel.reqItemQty,
                'justification': productModel.justification
              }
          ]
        },
        isFormData: false,
        showSuccessMessage: true,
        successMessage: 'Submitted Successfully',
      );
      if (response.isSuccessful) {
        clearSubmittedData();
        refreshDashboardData();
      }
    } else {
      showWarningSnackkbar(message: 'You have not selected any product');
    }
  }

  void refreshDashboardData() {
    HomeController controller = Get.find();
    controller.getApprovalSummary();
  }

  void clearSubmittedData() {
    quantityController.clear();
    justificationController.clear();
    selectedUsesPurposeModel.value = null;
    addedProductList.clear();
  }

  @override
  void onInit() {
    super.onInit();
    _apiCommunication = ApiCommunication();
    quantityController = TextEditingController();
    justificationController = TextEditingController();
    quantityFocusNode = FocusNode();
    justificationFocusNode = FocusNode();
    getUsesPurposeList();
  }

  @override
  void onClose() {
    _apiCommunication.endConnection();
    quantityController.dispose();
    justificationController.dispose();
    quantityFocusNode.dispose();
    justificationFocusNode.dispose();
    super.onClose();
  }
}
