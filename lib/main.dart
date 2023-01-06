import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:phantom/app/data/resources/strings.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appTile,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
