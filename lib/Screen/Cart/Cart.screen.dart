import 'package:bazar/Screen/payment/address.payment.dart';
import 'package:bazar/component/Button.component.dart';
import 'package:bazar/component/bottomsheet.component.dart';
import 'package:bazar/controller/cart.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Shoping bag",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<CartController>(
                  builder: (controller) {
                    return Obx(
                      () {
                        if (controller.product.length != 0) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.757,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListView.builder(
                                    itemCount: controller.product?.length ?? 0,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 6,
                                        ),
                                        // height: 160,
                                        decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromARGB(
                                                      234, 158, 158, 158))),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  // color: Colors.teal,
                                                  height: 120,
                                                  width: 120,
                                                  child: Image.network(
                                                    controller.product[index]
                                                            ['cartproduct']
                                                        ['image'],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller.product[index]
                                                              ['cartproduct']
                                                          ['name'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${controller.product[index]['cartproduct']['gender']} ${controller.product[index]['type']} Shoes",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    const Text(
                                                      "colors : multi",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "size : ${controller.product[index]['size']} UK",
                                                      style: const TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  hoverColor: Colors.grey,
                                                  onTap: () {
                                                    controller.qty.value =
                                                        controller
                                                                .product[index]
                                                            ['qty'];
                                                    showModalBottomSheet(
                                                      backgroundColor: Colors
                                                          .white
                                                          .withOpacity(0.9),
                                                      context: context,
                                                      builder: (context) {
                                                        return bottomsheet(
                                                          index,
                                                          cartController,
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Qty: ${controller.product[index]['qty']}",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        const Icon(
                                                          Icons
                                                              .keyboard_arrow_down_outlined,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "MRP : \$ ${controller.product[index]['cartproduct']['price']}.00",
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      const Text(
                                                        "Incl. of taxes",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const Text(
                                                        "(Also includes all applicable duties)",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  BillText(
                                      "Subtotal",
                                      "\$ ${controller.total.value}",
                                      Colors.grey),
                                  BillText("Shipping", "\$ 5.00", Colors.grey),
                                  BillText(
                                    "Estimated total",
                                    "\$ ${controller.total.value + 5.00}",
                                    Colors.black,
                                  ),
                                  if (controller.product.length > 2)
                                    SizedBox(
                                      height: 100,
                                    ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            // color: Colors.amber,
                            child: const Center(
                              child: Text(
                                "Nothing is here",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          // Obx(
          //   () {
          //     if (cartController.product != null) {
          //       return
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: Button(
              () {
                Get.to(() => Address(cartController));
              },
              "Checkout",
              null,
              Colors.black,
            ),
          )
          //   ;
          // } else {
          //   return Container();
          // }
          // },
          // ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BillText extends StatelessWidget {
  String text1, text2;
  Color color;
  BillText(this.text1, this.text2, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
