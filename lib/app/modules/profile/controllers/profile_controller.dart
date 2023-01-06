import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phantom/app/data/localStorage/user_data.dart';
import 'package:phantom/app/data/services/model/user_model.dart';
import 'package:phantom/app/routes/app_pages.dart';

class ProfileController extends GetxController with StateMixin<bool> {
  final isLoading = false.obs;

  final ScrollController scrollController = ScrollController();

  final user = UserModel(
    username: '',
    email: '',
    phone: '',
    gender: '',
    address: '',
    designation: '',
    company: '',
    department: '',
    dob: DateTime.now(),
  ).obs;

  @override
  void onInit() async {
    super.onInit();
    change(true, status: RxStatus.loading());
    user.value = await UserDetails().readUserDetails();
    final isRememberMe = RememberUser().checkRememberUser();
    change(true, status: RxStatus.success());
  }

  /// ## Logout User
  /// * deleting user details from local storage
  /// * navigate to login page
  Future<void> logoutUser() async {
    isLoading.value = true;
    await UserDetails().deleteUserDetailsFromBox();
    Get.offAllNamed(Routes.LOGIN);
    isLoading.value = false;
  }
}
