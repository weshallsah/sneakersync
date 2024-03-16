import 'package:bazar/Screen/home/product.screen.dart';
import 'package:bazar/component/Loading.component.dart';
import 'package:bazar/controller/home.controller.dart';
import 'package:bazar/controller/productview.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  String typename;
  HomeController homeController;
  ProductList(this.typename, this.homeController, {super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Obx(
        () => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.product[typename]?.length ?? 0,
            itemBuilder: (context, index) {
              if (index == controller.product[typename].length - 1 &&
                  !controller.isLoading.value) {
                controller.reloadproduct(typename);
              }
              return InkWell(
                enableFeedback: true,
                onTap: () {
                  Get.to(
                    () => WatingScreen(
                      Get.put(
                        Productcontroller(
                          controller.product[typename][index]['_id'],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 150,
                  width: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    image: DecorationImage(
                      image: NetworkImage(
                        controller.product[typename][index]['image'],
                        scale: 1,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
