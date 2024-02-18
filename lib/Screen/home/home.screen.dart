import 'package:bazar/Screen/profile/profile.screen.dart';
import 'package:bazar/component/BrandName.component.dart';
import 'package:bazar/component/Saliding.component.dart';
import 'package:bazar/component/homeHeader.component.dart';
import 'package:bazar/controller/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

   Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sneakersync"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const Profile());
            },
            icon: const Icon(
              Icons.person,
            ),
          ),
          IconButton(
            onPressed: () async {
              // await AuthService.deleteuser();
            },
            icon: const Icon(
              Icons.explore,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
            child: HeaderPage(),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.07,
            child: BrandName(),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.711,
            // color: Colors.amber,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Saliding(homeController),
                  const SizedBox(
                    height: 15,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {},
                        child: Card(
                          elevation: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
