import 'package:bazar/Screen/payment/address.payment.dart';
import 'package:bazar/component/Loading.component.dart';
import 'package:bazar/controller/splash.controller.dart';
import "package:flutter/material.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Loading(),
      // home: ,
    );
  }
}
