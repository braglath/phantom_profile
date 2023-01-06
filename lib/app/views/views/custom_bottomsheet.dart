import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomBottomSheet {
  IconData icon1;
  IconData icon2;
  String title1;
  String titile2;
  Function()? onTap1;
  Function()? onTap2;

  CustomBottomSheet(
      {required this.icon1,
      required this.icon2,
      required this.title1,
      required this.titile2,
      required this.onTap1,
      required this.onTap2});
  void show() {
  
    Get.bottomSheet(
      Wrap(
        children: [
          ListTile(
            tileColor: Colors.white,
            leading: FaIcon(
              icon1,
              color: Colors.grey,
            ),
            title: Text(
              title1,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            onTap: onTap1,
          ),
          ListTile(
            tileColor: Colors.white,
            leading: FaIcon(
              icon2,
              color: Colors.grey,
            ),
            title: Text(titile2,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
            onTap: onTap2,
          ),
        ],
      ),
      // barrierColor: Colors.red[50],
      isDismissible: true,
      enableDrag: true,
    );
  }
}
