import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phantom/app/data/services/api/login_api.dart';
import 'package:phantom/app/routes/app_pages.dart';
import 'package:phantom/app/views/views/toast.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  final isRememberMe = false.obs;
  final obscurePassword = true.obs;

  void onRememberMeChanged(bool? value) {
    if (value == null) return;
    isRememberMe.value = value;
  }

  /// ## Login User
  /// * validate each fields, move to next code execution
  /// * hit login api and get bool value
  /// * if successful login, navigate to home screen, locally storing user data are done inside api call
  void loginUser(context, String email, String password) async {
    if (!formState.currentState!.validate()) return;
    // else
    isLoading.value = true;
    final isLoggedIn = await loginAPI(
        username: emailController.text,
        password: passwordController.text,
        isRememberMe: isRememberMe.value);

    if (isLoggedIn) {
      showToast(message: 'Logged In successfully');
      Get.offAllNamed(Routes.PROFILE);
    }

    // uncomment below if you want to clear the texts after login api hit
    // will be helpful to remove values if login api returns false

    // emailController.clear();
    // passwordController.clear();

    isLoading.value = false;
  }
}
