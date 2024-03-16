import 'package:bazar/controller/splash.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ServerErrorPage extends StatelessWidget {
  ServerErrorPage({super.key});
  final SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset("assets/lotties/servererror.json"),
          SizedBox(
            height: 35,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              splashController.onReady();
            },
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.redAccent,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "Re-try",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
