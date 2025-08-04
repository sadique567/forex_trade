import 'package:flutter/material.dart';
import 'package:forex_trade/app/data/storage.dart';
import 'package:forex_trade/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  late PageController pageController;
  SharedPreferences prefs = Get.find<SharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    // move to page 1 after 3 seconds
    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(
      Duration(milliseconds: 100),
    ); // Give time to init plugins


    bool isLoggedIn = prefs.getBool(MyStorage.isLogedin) ?? false;

    Future.delayed(Duration(seconds: 3), () {
      if (isLoggedIn) {
        Get.toNamed(AppRoutes.DASHBOARD_SCREEN);
      } else {
        pageController.animateToPage(
          1,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pageController.dispose();
  }
}
