import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phantom/app/data/resources/image_assets.dart';
import 'package:phantom/app/data/resources/strings.dart';
import 'package:phantom/app/modules/profile/views/profile_view.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  SplashScreenView({Key? key}) : super(key: key);

  final splashController =
      Get.put<SplashScreenController>(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      duration: 500,
      splash: Hero(
          tag: Strings.heroTagLogo, child: Lottie.asset(ImageAssets.splash)),
      splashIconSize: 200,
      nextScreen: const ProfileView(),
      disableNavigation: true,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
