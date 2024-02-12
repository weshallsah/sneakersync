import 'package:bazar/Screen/auth/login.screen.dart';
import 'package:bazar/Screen/auth/register.screen.dart';
import 'package:bazar/Screen/home/home.screen.dart';
import 'package:bazar/controller/splash.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Landing extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/sneakersync.png'),
          Expanded(
            child: Container(
              // color: Colors.amber,
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextName(name: "The"),
                  TextName(name: "Awesonme"),
                  TextName(name: "Branded"),
                  TextName(name: "Shoes"),
                  const Text(
                    "Enjoy your vacation with our super comfy shoes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    height: 65,
                    child: GetBuilder<SplashController>(
                      builder: (controller) => CupertinoButton(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                        onPressed: () {
                          if (controller.islogin.value) {
                            // Get.back();
                            Navigator.pop(context);
                            Get.to(Home());
                          } else {
                            Get.to(Login());
                          }
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Get Started",
                              style: TextStyle(
                                // color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextName extends StatelessWidget {
  String name;
  TextName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
