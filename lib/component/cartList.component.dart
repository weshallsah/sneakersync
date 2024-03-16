import 'package:bazar/controller/cart.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
      return ListView.builder(
          itemCount: 2,
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
                    bottom:
                        BorderSide(color: Color.fromARGB(234, 158, 158, 158))),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.teal,
                        height: 120,
                        width: 120,
                        child: const Center(
                          child: Text(
                            "image",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product name",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Men's Running Shoes",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "colors : multi",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "size : 10",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        hoverColor: Colors.grey,
                        onTap: () {},
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "Qty:1",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "MRP : \$ 100.00",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Incl. of taxes",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "(Also includes all applicable duties)",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          });
    });
  }
}
