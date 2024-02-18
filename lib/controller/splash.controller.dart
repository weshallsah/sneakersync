import 'package:bazar/Screen/home/home.screen.dart';
import 'package:bazar/Screen/splash/splash.screen.dart';
import 'package:bazar/Screen/service/Auth.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await Future.delayed(Duration(seconds: 1)).then((value) async {
      if (await AuthService.islogin()) {
        Get.offAll(Home());
      } else {
        Get.offAll(Landing());
      }
    });
  }
}
