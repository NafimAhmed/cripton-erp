import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/loader.dart';
import '../../../utils/snackbar.dart';

class FilePreviewController extends GetxController {
  late final WebViewController webViewcontroller;
  String? url;
  String? fileName;

  void initializeWebViewController() {
    webViewcontroller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            debugPrint('Progress: $progress');
          },
          onPageStarted: (String url) {
            showLoader();
          },
          onPageFinished: (String url) {
            dismissLoader();
          },
          onWebResourceError: (WebResourceError error) {
            showErrorSnackkbar(message: 'File can not be loaded');
          },
        ),
      )
      ..loadRequest(Uri.parse(url ?? 'https://flutter.dev'));
  }

  @override
  void onInit() {
    //Url
    url = Get.arguments;
    fileName = url?.split('/').last;
    debugPrint('File Url: $url');
    debugPrint('File Name: $fileName');
    initializeWebViewController();
    super.onInit();
  }
}
