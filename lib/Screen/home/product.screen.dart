import 'package:bazar/Screen/Cart/Cart.screen.dart';
import 'package:bazar/component/Button.component.dart';
import 'package:bazar/component/Loading.component.dart';
import 'package:bazar/controller/productview.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class WatingScreen extends StatelessWidget {
  Productcontroller productcontroller;
  WatingScreen(this.productcontroller, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Productcontroller>(
      builder: (controller) {
        return Obx(
          () => !controller.isloaded.value
              ? const Loading()
              : Productview(controller),
        );
      },
    );
  }
}

class Productview extends StatelessWidget {
  Productcontroller productcontroller;
  Productview(this.productcontroller, {super.key});
  // final scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height*0.4);
    return Scaffold(
      // key: scaffoldState,
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CartPage());
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.explore),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<Productcontroller>(
              builder: (imagecontroller) {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.489,
                      width: double.infinity,
                      child: Image.network(
                        imagecontroller.data['image'],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.sizeOf(context).height * 0.178,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 15),
                            height: MediaQuery.sizeOf(context).height * 0.178,
                            width: MediaQuery.sizeOf(context).height * 0.142,
                            // color: Colors.grey,
                            child: Image.network(
                              imagecontroller.data['image'],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: GetBuilder<Productcontroller>(
                builder: (textcontroller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${textcontroller.data['gender']}'s ${textcontroller.data['type']}  Shoes",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        textcontroller.data['name'],
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "USD : \$ ${textcontroller.data['price']}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "Incl of taxes\n (Also include all application duties)",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "${textcontroller.data['description']}",
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Sneaker-Head: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const Icon(
                                      Icons.store_mall_directory_outlined),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${textcontroller.data['sneakerhead']['username']}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    size: 20,
                                    Icons.verified,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Brand: ${textcontroller.data['brand_name']['brand_name']}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "Style: FQ7832-142",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "Country/Region of Origin: Vietnam",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GetBuilder<Productcontroller>(
                        builder: (controller) {
                          return Button(
                            () {},
                            "Size UK ${controller.selectedsize}",
                            const Icon(
                              size: 28,
                              Icons.keyboard_arrow_down,
                            ),
                            Colors.transparent,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GetBuilder<Productcontroller>(
                        builder: (controller) {
                          return Button(
                            () {
                              controller.addtocart();
                            },
                            "Add to Bag",
                            const Icon(
                              Icons.shopping_bag_outlined,
                              size: 25,
                            ),
                            Colors.transparent,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GetBuilder<Productcontroller>(
                        builder: (controller) {
                          return Button(
                            () {
                              controller.addtowishlist();
                            },
                            "Favrote",
                            controller.data['fav']
                                ? const Icon(
                                    Icons.favorite,
                                    size: 25,
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                    size: 25,
                                  ),
                            Colors.transparent,
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
