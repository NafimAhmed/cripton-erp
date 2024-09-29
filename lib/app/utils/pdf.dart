import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'loader.dart';
import 'snackbar.dart';

showDownloadedPDF(String url) async {
  debugPrint(url);
  final dioObject = dio.Dio();
  showLoader();
  final Directory? directory = GetPlatform.isAndroid
      ? await getExternalStorageDirectory() //FOR ANDROID
      : await getApplicationDocumentsDirectory(); //FOR iOS
  try {
    final response = dioObject.download(url, '${directory?.path}/example.pdf');
    dismissLoader();
    debugPrint(response.toString());
    OpenFile.open('${directory?.path}/example.pdf');
  } catch (error) {
    showErrorSnackkbar(message: error.toString());
    debugPrint(error.toString());
  }
}

bool isPdf(String path) {
  String extenstion = path.split('.').last;
  return extenstion == 'pdf';
}
