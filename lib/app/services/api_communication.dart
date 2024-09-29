import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../config/api_constant.dart';
import '../data/login_creadential.dart';
import '../data/server_credential.dart';
import '../models/api_response.dart';
import '../utils/loader.dart';
import '../utils/network.dart';
import '../utils/snackbar.dart';

class ApiCommunication {
  late dio.Dio _dio;
  final String baseUrl = ApiConstant.BASE_URL;
  late Map<String, dynamic> header;
  late Connectivity connectivity;
  late LoginCredential _loginCredential;
  late ServerCredential _serverCredential;
  late String? token;

  ApiCommunication({int? connectTimeout, int? receiveTimeout}) {
    _dio = Dio();
    _dio.options.connectTimeout =
        Duration(milliseconds: connectTimeout ?? 60000); //1000 = 1s
    _dio.options.receiveTimeout =
        Duration(milliseconds: receiveTimeout ?? 60000);

    connectivity = Connectivity();
    _serverCredential = ServerCredential();
    _loginCredential = LoginCredential();
    token = _loginCredential.getToken();
    header = {
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    };
  }

  Future<bool> isConnectedToInternet() async {
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  Future<ApiResponse> doPostRequest({
    required String apiEndPoint,
    Map<String, dynamic>? requestData,
    File? file,
    String? fileKey,
    bool isFormData = false,
    bool enableLoading = true,
    String responseDataKey = ApiConstant.DATA_RESPONSE,
    String? successMessage,
    bool showSuccessMessage = false,
    String? errorMessage,
    bool addUserData = true,
  }) async {
    dio.Response? response;
    // String requestUrl = baseUrl + apiEndPoint;
    String requestUrl =
        '${_serverCredential.getIpPortData() ?? ''}/api/v1/$apiEndPoint';
    late String responseErrorMessage;

    if (addUserData) {
      requestData?.addAll({
        'regionId': _loginCredential.getUserData().regionId,
        'organizationId': _loginCredential.getUserData().organizationId
      });
    }

    debugPrint(
        'Request Url: $requestUrl\n\nIs Form Request: $isFormData \n\n Request Data: $requestData\n');

    if (await isConnectedToInternet()) {
      try {
        if (enableLoading) showLoader();
        final Object? requestObject;
        if (isFormData) {
          // If request data is Form data
          FormData requestFormData = FormData.fromMap(requestData!);
          if (file != null) {
            // Having file to attatch
            requestFormData.files.add(MapEntry(
                fileKey ?? 'Attachment',
                dio.MultipartFile.fromFileSync(file.path,
                    contentType: getMediaTypeFromFile(file),
                    filename: getFileNameFromFile(file))));
          }
          requestObject = requestFormData;
        } else {
          // If request data is Raw data
          requestObject = requestData;
        }
        response = await _dio.post(
          requestUrl,
          data: requestObject,
          options: dio.Options(headers: header),
        );
        if (enableLoading) dismissLoader();
      } on DioException catch (error) {
        if (enableLoading) dismissLoader();
        Map<String, dynamic> messageMap =
            error.response?.data as Map<String, dynamic>;
        String responseErrorMessage = messageMap['message'];
        showErrorSnackkbar(message: responseErrorMessage);
        debugPrint(responseErrorMessage);
        return ApiResponse(
            isSuccessful: false, errorMessage: responseErrorMessage);
      } on SocketException catch (error) {
        if (enableLoading) dismissLoader();
        responseErrorMessage = error.message;
        showErrorSnackkbar(message: responseErrorMessage);
        debugPrint(errorMessage);
        return ApiResponse(
            isSuccessful: false, errorMessage: responseErrorMessage);
      } catch (error) {
        if (enableLoading) dismissLoader();
        responseErrorMessage = error.toString();
        showErrorSnackkbar(message: responseErrorMessage);
        debugPrint(errorMessage);
        return ApiResponse(
          isSuccessful: false,
          errorMessage: responseErrorMessage,
        );
      }

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        showSuccessMessage
            ? showSuccessSnackkbar(
                message: successMessage ?? responseData['message'])
            : ();
        debugPrint('$responseData');
        return ApiResponse(
          isSuccessful: true,
          statusCode: responseData[ApiConstant.STATUS_CODE_KEY],
          data: responseDataKey != ApiConstant.FULL_RESPONSE
              ? responseData[responseDataKey]
              : responseData,
          totalCount: responseData[ApiConstant.TOTAL_COUNT],
        );
      } else {
        showErrorSnackkbar(message: '${response.statusCode}');
        debugPrint('${response.statusCode}');
        return ApiResponse(
          isSuccessful: false,
          statusCode: response.statusCode,
        );
      }
    } else {
      errorMessage = 'You are not connected with mobile/wifi network';
      showWarningSnackkbar(message: errorMessage);
      debugPrint(errorMessage);
      return ApiResponse(
        isSuccessful: false,
        statusCode: 503,
        errorMessage: errorMessage,
      );
    }
  }

  void endConnection() => _dio.close(force: true);
}
