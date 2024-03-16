import 'package:bazar/Screen/Cart/Cart.screen.dart';
import 'package:bazar/Screen/profile/profile.screen.dart';
import 'package:bazar/component/BrandName.component.dart';
import 'package:bazar/component/Listview.component.dart';
import 'package:bazar/component/Loading.component.dart';
import 'package:bazar/component/Saliding.component.dart';
import 'package:bazar/component/homeHeader.component.dart';
import 'package:bazar/controller/home.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lottie/lottie.dart';

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
            child: BrandName(
              homeController: homeController,
            ),
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
                  // Saliding(homeController),
                  const SizedBox(
                    height: 15,
                  ),
                  GetBuilder<HomeController>(builder: (context) {
                    return Obx(
                      () => ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homeController.type.length,
                        itemBuilder: (context, index) {
                          homeController
                              .fetchproduct(homeController.type[index]);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homeController.type[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                height: 150,
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: ProductList(
                                    homeController.type[index], homeController),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
