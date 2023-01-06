import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogue {
  String title;
  String textConfirm;
  String textCancel;
  Function()? onpressedConfirm;
  Function()? onpressedCancel;
  Widget? contentWidget;
  bool isDismissible = false;
  CustomDialogue(
      {required this.title,
      required this.textConfirm,
      required this.textCancel,
      required this.onpressedConfirm,
      required this.onpressedCancel,
      required this.contentWidget,
      required this.isDismissible});

  void showDialogue() {
    Get.defaultDialog(
        barrierDismissible: false,
        title: title,
        backgroundColor: Colors.white,
        titleStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        buttonColor: Colors.amber,
        confirm: ElevatedButton(
            onPressed: onpressedConfirm, child: Text(textConfirm)),
        cancel:
            ElevatedButton(onPressed: onpressedCancel, child: Text(textCancel)),
        radius: 12,
        content: contentWidget);
  }
}
