import 'package:bazar/Screen/home/home.screen.dart';
import 'package:bazar/Screen/myorder/myorder.screen.dart';
import 'package:bazar/Screen/profile/profile.screen.dart';
import 'package:bazar/Screen/splash/splash.screen.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Landing(),
    );
  }
}
