import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/file_preview_controller.dart';

class FilePreviewView extends GetView<FilePreviewController> {
  const FilePreviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint('Build Method called');

    return Scaffold(
        appBar: AppBar(
          title: const Text('File Preview'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Container(
            //   color: Colors.white,
            //   padding: const EdgeInsets.all(20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       const Text(
            //         'File Name',
            //         textAlign: TextAlign.center,
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //       ),
            //       const SizedBox(height: 10),
            //       Text(
            //         '${controller.fileName}',
            //         textAlign: TextAlign.center,
            //       )
            //     ],
            //   ),
            // ),
            // const Divider(),
            Expanded(
              child: controller.url != null
                  ? WebViewWidget(
                      controller: controller.webViewcontroller,
                    )
                  : const Center(
                      child: Text('No file found'),
                    ),
            ),
          ],
        ));
  }
}
