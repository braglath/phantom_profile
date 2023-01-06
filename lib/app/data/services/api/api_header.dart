//? below is the common header we will be using whenever we are calling an api
//? we will be adding some more properties to this common header using .addAll() property
import 'dart:developer';

class CommonHeader {
  //? use commonHeaderCall on all api service
  static Future<Map<String, String>> commonHeader() async {
    // AndroidDeviceInfo androidInfo = await APIInstances.deviceInfoID.androidInfo;
    Map<String, String> headers = {
      'Content-Type': 'application/json'
      // 'Mobile': "iOS",
      // 'x-client-date': DateTime.now().toString(),
      // 'x-client-data': "3BA0C717-C412-43E4-8B99-E0CB2A7167EE"
    };
    return headers;
  }
}
