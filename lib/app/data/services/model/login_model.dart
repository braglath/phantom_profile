// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.status,
    required this.message,
    required this.user,
    required this.accessToken,
  });

  final String status;
  final String message;
  final List<User> user;
  final String accessToken;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"] ?? '',
        message: json["message"] ?? '',
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
        accessToken: json["access_token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
        "access_token": accessToken,
      };
}

class User {
  User({
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.username,
    required this.roleUsersId,
    required this.companyId,
    required this.departmentId,
    required this.email,
    required this.contactNo,
    required this.dateOfBirth,
    required this.gender,
    required this.profilePhoto,
    required this.address,
    required this.city,
    required this.state,
    required this.designationName,
    required this.companyName,
    required this.departmentName,
  });

  final String firstName;
  final String id;
  final String lastName;
  final String username;
  final String roleUsersId;
  final String companyId;
  final String departmentId;
  final String email;
  final String contactNo;
  final DateTime dateOfBirth;
  final String gender;
  final String profilePhoto;
  final String address;
  final String city;
  final String state;
  final String designationName;
  final String companyName;
  final String departmentName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"] ?? '',
        id: json["id"] ?? '',
        lastName: json["last_name"] ?? '',
        username: json["username"] ?? '',
        roleUsersId: json["role_users_id"] ?? '',
        companyId: json["company_id"] ?? '',
        departmentId: json["department_id"] ?? '',
        email: json["email"] ?? '',
        contactNo: json["contact_no"] ?? '',
        dateOfBirth: json["date_of_birth"] != null
            ? DateTime.parse(json["date_of_birth"])
            : DateTime.now(),
        gender: json["gender"] ?? '',
        profilePhoto: json["profile_photo"] ?? '',
        address: json["address"] ?? '',
        city: json["city"] ?? '',
        state: json["state"] ?? '',
        designationName: json["designation_name"] ?? '',
        companyName: json["company_name"] ?? '',
        departmentName: json["department_name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "id": id,
        "last_name": lastName,
        "username": username,
        "role_users_id": roleUsersId,
        "company_id": companyId,
        "department_id": departmentId,
        "email": email,
        "contact_no": contactNo,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "profile_photo": profilePhoto,
        "address": address,
        "city": city,
        "state": state,
        "designation_name": designationName,
        "company_name": companyName,
        "department_name": departmentName,
      };
}
