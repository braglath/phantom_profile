import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phantom/app/data/constants/app_constants.dart';
import 'package:phantom/app/data/mixins/field_validation_mixins.dart';
import 'package:phantom/app/data/resources/color_resources.dart';
import 'package:phantom/app/data/resources/image_assets.dart';
import 'package:phantom/app/data/resources/strings.dart';
import 'package:phantom/app/routes/app_pages.dart';
import 'package:phantom/app/views/views/custom_name_field_view.dart';
import 'package:phantom/app/views/views/custom_password_field_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: Constants().DEVICE_WIDTH,
          height: Constants().DEVICE_HEIGHT,
          child: SafeArea(child: LoginBody(controller: controller)),
        ),
      ));
}

class LoginBody extends StatelessWidget {
  final LoginController controller;
  const LoginBody({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LoginText(),
          Constants.SIZE_HEIGHT_20,
          const Logo(),
          Constants.SIZE_HEIGHT_50,
          FieldsNButton(controller: controller),
          Constants.SPACER
        ],
      );
}

class LoginText extends StatelessWidget {
  const LoginText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            Strings.login,
            style: context.theme.textTheme.headline2,
          ),
        ),
      );
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Hero(
        tag: Strings.heroTagLogo,
        child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(ImageAssets.logo, fit: BoxFit.contain)),
      );
}

class FieldsNButton extends StatelessWidget {
  final LoginController controller;
  const FieldsNButton({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => Form(
        key: controller.formState,
        child: Column(
          children: [
            Constants.SIZE_HEIGHT_15,
            Fields(controller: controller),
            Constants.SIZE_HEIGHT_10,
            RememberMeNForgotPassword(controller: controller),
            Constants.SIZE_HEIGHT_20,
            LoginButton(controller: controller),
          ],
        ),
      );
}

class Fields extends StatelessWidget with FieldValidations {
  final LoginController controller;
  const Fields({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: CustomNameField(
            emailController: controller.emailController,
            validator: (username) => usernameValidation(username: username),
            label: Strings.username,
          ),
        ),
        Constants.SIZE_HEIGHT_15,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Obx(() => CustompasswordField(
                passwordController: controller.passwordController,
                obscureText: controller.obscurePassword.value,
                validator: (password) => passwordValidation(password),
                obsOnTap: () => controller.obscurePassword.value =
                    !controller.obscurePassword.value,
                label: Strings.password,
              )),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) => Center(
        child: Obx(() => ElevatedButton(
              onPressed: () => controller.loginUser(
                  context,
                  controller.emailController.text,
                  controller.passwordController.text),
              child: controller.isLoading.isFalse
                  ? Text(
                      Strings.login,
                      style: context.theme.textTheme.headline6
                          ?.copyWith(color: ColorResources.white),
                    )
                  : const SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        backgroundColor: ColorResources.blue,
                        color: ColorResources.white,
                      ),
                    ),
            )),
      );
}

class RememberMeNForgotPassword extends StatelessWidget {
  const RememberMeNForgotPassword({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.centerLeft,
      child: RememberMe(controller: controller));
}

class RememberMe extends StatelessWidget {
  final LoginController controller;
  const RememberMe({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => TextButton(
            onPressed: () =>
                controller.onRememberMeChanged(!controller.isRememberMe.value),
            child: Row(
              children: [
                Checkbox(
                  value: controller.isRememberMe.value,
                  onChanged: (value) => controller.onRememberMeChanged(value),
                ),
                const Text(LoginPageStrings.rememberMe),
              ],
            )),
      );
}
