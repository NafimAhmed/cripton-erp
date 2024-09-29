import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../../../../../../../models/api_response.dart';
import '../../../../../../../../services/api_communication.dart';
import '../../../../../../../../utils/color.dart';
import '../../../../../../../../utils/date_time.dart';
import '../../../../../../../../utils/snackbar.dart';
import '../model/attendence_submission.dart';

class AttendanceSubmissionController extends GetxController {
  late ApiCommunication _apiCommunication;
  Rx<Color> attendanceButtonBackgroundColor = Colors.white.obs;
  Rx<Color> attendanceButtonTextColor = PRIMARY_COLOR.obs;
  Rx<String> attendanceButtonText = 'ATTENDANCE'.obs;
  Location location = Location();
  AttendenceSubmissionModel? attendenceSubmissionModel;

  Future<bool> isLocationPermissionGranted() async {
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      //Permission Denied
      //Requesting Permission.
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        //Permission Denied
        return false;
      } else {
        // Permission Granted.
        return true;
      }
    } else {
      // Permission Granted.
      return true;
    }
  }

  Future<bool> isLocationServiceEnabled() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      // Location service disabled.
      // Requesting for location service.
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Location service disabled.
        return false;
      } else {
        // Location service enabled.
        return true;
      }
    } else {
      // Location service enabled.
      return true;
    }
  }

  Future<LocationData?> getLocationData() async {
    if (await isLocationPermissionGranted()) {
      if (await isLocationServiceEnabled()) {
        LocationData locationData = await location.getLocation();
        return locationData;
      } else {
        showWarningSnackkbar(message: 'Location service is not enabled');
        return null;
      }
    } else {
      showWarningSnackkbar(message: 'Location permission is not enabled');
      return null;
    }
  }

  Future getAttendanceData() async {
    ApiResponse response = await _apiCommunication.doPostRequest(
      apiEndPoint: 'Attendance/CheckLogInStatus',
    );
    if (response.data != null) {
      attendanceButtonText.value = 'Submit Out';
      attendenceSubmissionModel = AttendenceSubmissionModel.fromMap(
          response.data as Map<String, dynamic>);
    } else {
      attendanceButtonText.value = 'Submit In';
    }
  }

  submitAttendanceRequisition() async {
    LocationData? locationData = await getLocationData();
    if (locationData != null) {
      DateTime dateTime = DateTime.now();
      Map<String, dynamic> inputData = {
        'attendanceDate': getFormatedDateInDBFormate(dateTime),
        'inLocation': null,
        'outLocation': null,
        'comment': 'I am outside of office'
      };
      if (attendenceSubmissionModel == null) {
        inputData.addAll({
          'inTime': getFormatedTimeInDBFormate(dateTime),
          'inLatitude': '${locationData.latitude}',
          'inLongitude': '${locationData.longitude}',
        });
      } else {
        inputData.addAll({
          'outTime': getFormatedTimeInDBFormate(dateTime),
          'outLatitude': '${locationData.latitude}',
          'outLongitude': '${locationData.longitude}',
        });
      }

      ApiResponse apiResponse = await _apiCommunication.doPostRequest(
        apiEndPoint: 'Attendance/SubmitManualAttendance',
        responseDataKey: 'data',
        requestData: inputData,
        isFormData: false,
        showSuccessMessage: true,
        successMessage: 'Attendance submitted successfully',
      );
      if (apiResponse.isSuccessful) {
        getAttendanceData();
      }
    } else {
      showErrorSnackkbar(message: 'Could not get location data');
    }
  }

  @override
  void onInit() {
    _apiCommunication = ApiCommunication();
    super.onInit();
  }

  @override
  void onReady() {
    getAttendanceData();
    super.onReady();
  }

  @override
  void onClose() {
    _apiCommunication.endConnection();
    super.onClose();
  }
}
