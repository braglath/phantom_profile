import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phantom/app/data/constants/app_constants.dart';
import 'package:phantom/app/data/resources/color_resources.dart';
import 'package:phantom/app/data/resources/strings.dart';
import '../../../data/resources/image_assets.dart';
import '../../../views/animation/top_to_bottom_animation.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: controller.obx(
            (state) => NestedScrollView(
                physics: const BouncingScrollPhysics(),
                floatHeaderSlivers: true,
                controller: controller.scrollController,
                headerSliverBuilder: (_, innerBosIsScrolled) => [
                      SliverAppBar(
                          pinned: true,
                          floating: true,
                          snap: false,
                          title: Builder(
                              builder: (context) => const AppBarTitle()),
                          centerTitle: true,
                          bottom: PreferredSize(
                              preferredSize: const Size.fromHeight(56),
                              child: Text(controller.user.value.username,
                                  style: context.theme.textTheme.headline4!
                                      .copyWith(color: ColorResources.white)))),
                    ],
                body: ProfileBody(controller: controller)),
            onLoading: SizedBox(
                width: Constants().DEVICE_WIDTH,
                height: Constants().DEVICE_HEIGHT,
                child: const Center(child: CircularProgressIndicator()))),
      );
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 5,
          ),
          const Text(HomePageStrings.appBarTitle1),
          TopToBottomAnimationView(
            duration: const Duration(milliseconds: 1000),
            child: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset(
                  ImageAssets.logo,
                  fit: BoxFit.contain,
                  // color: ColorResources.white,
                )),
          ),
          const Text(HomePageStrings.appBarTitle2),
        ],
      );
}

class ProfileBody extends StatelessWidget {
  final ProfileController controller;
  const ProfileBody({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Constants.SPACER,
              Details(controller: controller),
              Constants.SPACER,
              LogoutButton(controller: controller)
            ],
          )),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key, required this.controller}) : super(key: key);

  final ProfileController controller;

  @override
  Widget build(BuildContext context) => Obx(() => ElevatedButton(
        onPressed: () async => await controller.logoutUser(),
        child: controller.isLoading.isFalse
            ? Text(
                Strings.logout,
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
      ));
}

class Details extends StatelessWidget {
  final ProfileController controller;
  const Details({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(15),
        width: Constants().DEVICE_WIDTH,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorResources.blue!,
                offset: const Offset(3, 5),
                blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [ColorResources.white!, ColorResources.blue!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IndividualDetails(
                category: 'Email:', value: controller.user.value.email),
            IndividualDetails(
                category: 'Phonenumber:', value: controller.user.value.phone),
            IndividualDetails(
                category: 'Address:', value: controller.user.value.address),
            IndividualDetails(
                category: 'Designation:',
                value: controller.user.value.designation),
            IndividualDetails(
                category: 'Department:',
                value: controller.user.value.department),
            IndividualDetails(
                category: 'Company:', value: controller.user.value.company),
          ],
        ),
      );
}

class IndividualDetails extends StatelessWidget {
  final String category;
  final String value;
  const IndividualDetails(
      {Key? key, required this.category, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        horizontalTitleGap: 0,
        contentPadding: EdgeInsets.zero,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$category ', style: context.theme.textTheme.caption),
          ],
        ),
        title: Text(
          value.isEmpty ? 'Nil' : value,
          style: context.theme.textTheme.headline5,
          textAlign: TextAlign.end,
        ),
      );
}
