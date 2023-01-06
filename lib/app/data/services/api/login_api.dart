import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:phantom/app/data/localStorage/user_data.dart';
import 'package:phantom/app/data/services/model/login_model.dart';
import 'package:phantom/app/views/views/toast.dart';

import '../../config/server_config.dart';
import 'api_header.dart';

Future<bool> loginAPI(
    {required String username,
    required String password,
    required bool isRememberMe}) async {
  Uri url = Uri.parse('${ServerConfig.serverUrl}/login');

  String body = jsonEncode(<String, dynamic>{
    'username': username,
    'password': password,
  }); // jsonEncoding the body with the above properties

  Map<String, String> headers = await CommonHeader.commonHeader();
  var clients = http.Client();

  try {
    var response = await clients.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      final errorRes = json.decode(response.body);
      if (errorRes['status'] == '001') {
        showToast(message: errorRes['message']);
        return false;
      } else {
        final decodedRes = loginModelFromJson(response.body);
        final user = decodedRes.user.first;
        await UserDetails().saveUserDetailsToBox(
            token: decodedRes.accessToken,
            name: user.username,
            phone: user.contactNo,
            email: user.email,
            profilePic: user.profilePhoto,
            userDOB: user.dateOfBirth,
            userGender: user.gender,
            userAddress: user.address,
            userDesignation: user.designationName,
            userCompany: user.companyName,
            userDepartment: user.departmentName,
            isUserLoggedIn: true,
            isRememberUser: isRememberMe);

        return true;
      }
    } else {
      showToast(message: 'Error logging in');
      return false;
    }
  } on PlatformException catch (e) {
    showToast(message: e.message.toString());
    return false;
  } on SocketException {
    return false;
  } on http.ClientException catch (e) {
    showToast(message: e.message.toString());
    return false;
  } catch (e) {
    showToast(message: e.toString());
    return false;
  } finally {
    clients.close();
  }
}
