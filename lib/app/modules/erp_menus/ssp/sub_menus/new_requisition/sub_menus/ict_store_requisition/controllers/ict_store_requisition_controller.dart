import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../models/api_response.dart';
import '../../../../../../../../services/api_communication.dart';
import '../../../../../../../../utils/snackbar.dart';
import '../../../../../../../home/controllers/home_controller.dart';
import '../models/ict_store.dart';
import '../models/ict_store_item.dart';
import '../models/uses_purpose.dart';

class IctStoreRequisitionController extends GetxController {
  late ApiCommunication _apiCommunication;

  late TextEditingController quantityController;
  late TextEditingController justificationController;
  late FocusNode quantityFocusNode;
  late FocusNode justificationFocusNode;
  final GlobalKey<FormState> storeRequisitionFormKey = GlobalKey();

  //Product For
  Rx<List<UsesPerpousModel>> usesPurposeList = Rx<List<UsesPerpousModel>>([]);
  Rx<UsesPerpousModel?> selectedUsesPurposeModel = Rx(null);

  RxList<ICTStoreModel> storeProductItemList = RxList([]);
  Rx<ICTStoreModel?> selectedICTStoreProductModel = Rx(null);
  RxList<ICTStoreItemModel> addedProductList = RxList([]);

  Future getUsesPurposeList() async {
    ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Requisition/GetListOfPurposeOfUse',
    );
    usesPurposeList.value = (response.data as List)
        .map((element) =>
            UsesPerpousModel.fromMap(element as Map<String, dynamic>))
        .toList();
  }

  bool isProductValidatedForAddingForRequisition() {
    if (selectedUsesPurposeModel.value != null) {
      // User perpose is selected.
      if (selectedICTStoreProductModel.value != null) {
        //Product is selected.
        if (storeRequisitionFormKey.currentState!.validate()) {
          // Having Quantity and Justification
          if (isProductAlreadyAdded()) {
            //! Product is already added.
            showWarningSnackkbar(message: 'This product is already added');
            return false;
          } else {
            // Product Can be added.
            return true;
          }
        } else {
          //! Missing Quantity or Justification
          return false;
        }
      } else {
        //! Product is not selected.
        showWarningSnackkbar(message: 'Please select product');
        return false;
      }
    } else {
      //! User perpose is not selected.
      showWarningSnackkbar(message: 'Please select the purpose first');
      return false;
    }
  }

  bool isProductAlreadyAdded() {
    for (ICTStoreItemModel addedProduct in addedProductList) {
      if (addedProduct.reqItemId == selectedICTStoreProductModel.value?.id) {
        return true;
      }
    }
    return false;
  }

  void removeProduct(index) {
    addedProductList.removeAt(index);
    addedProductList.refresh();
  }

  void addICTHardwareProductForRequisition(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (isProductValidatedForAddingForRequisition()) {
      addedProductList.add(
        ICTStoreItemModel(
          productName: selectedICTStoreProductModel.value?.productName,
          reqItemId: selectedICTStoreProductModel.value?.id,
          justification: justificationController.text,
          reqItemQty: quantityController.text,
          sortBy: '${addedProductList.length + 1}',
        ),
      );
      justificationController.clear();
      quantityController.clear();
      justificationFocusNode.unfocus();
      quantityFocusNode.unfocus();
    } else {}
  }

  Future<List<ICTStoreModel>> getICTStoreProductList(
      {required int page, String? searchKey}) async {
    ApiResponse response = await _apiCommunication.doPostRequest(
        apiEndPoint: 'Requisition/GetICTStoreProducts',
        requestData: {
          'rowIndex': (page - 1) * 20,
          'pageSize': 20,
          'searchContext': searchKey,
        });
    storeProductItemList.value = (response.data as List)
        .map(
            (element) => ICTStoreModel.fromMap(element as Map<String, dynamic>))
        .toList();

    return storeProductItemList;
  }

  submitICTStoreRequisition() async {
    if (addedProductList.isNotEmpty) {
      final ApiResponse response = await _apiCommunication.doPostRequest(
        apiEndPoint: 'Requisition/SaveICTStoreRequisition',
        responseDataKey: 'data',
        requestData: {
          'items': [
            for (ICTStoreItemModel productModel in addedProductList)
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
