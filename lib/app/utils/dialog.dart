import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/button.dart';
import 'color.dart';

showQuestionDialog({
  required String question,
  required VoidCallback onPressedYes,
}) {
  return Get.dialog(Dialog(
    child: Container(
      padding: const EdgeInsets.all(20),
      height: Get.height / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: PRIMARY_SWATCH, width: 8)),
              child: const Text(
                '?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: PRIMARY_SWATCH,
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              )),
          const SizedBox(height: 20),
          const Text(
            'Are you sure?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(question),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: SecondaryButton(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'No')),
              const SizedBox(width: 10),
              Expanded(
                  child: PrimaryButton(onPressed: onPressedYes, text: 'Yes')),
            ],
          )
        ],
      ),
    ),
  ));
}

void showYesNoDialog(
    {required VoidCallback onPressedYes, required String status}) {
  Get.dialog(Dialog(
    child: SizedBox(
      height: Get.height / 4,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          height: 56,
          color: PRIMARY_COLOR,
          child: const Center(
            child: Text(
              'Are You Sure?',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Do you want to $status? Once $status it can't be undo",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: PRIMARY_COLOR,
                      textStyle: const TextStyle(fontSize: 16)),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('No'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: PRIMARY_COLOR,
                      textStyle: const TextStyle(fontSize: 16)),
                  onPressed: () {
                    Get.back();
                    onPressedYes();
                  },
                  child: const Text('Yes'),
                ),
              )
            ],
          ),
        )
      ]),
    ),
  ));
}
