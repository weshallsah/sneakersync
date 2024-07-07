// ignore_for_file: must_be_immutable

import 'package:bazar/controller/cart.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bottomsheet extends StatelessWidget {
  final index;
  CartController cartController;
  bottomsheet(this.index, this.cartController, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        // initState: (state) ,
        builder: (controller) {
      return Container(
        height: 250,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quantity",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (controller.qty.value - 1 >= 0) {
                        controller.qty.value--;
                        // ignore: invalid_use_of_protected_member
                        controller.refresh();
                      }
                    },
                    icon: const Icon(
                      size: 35,
                      Icons.arrow_circle_left_outlined,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${controller.qty}",
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (controller.qty.value + 1 <= 10) {
                        controller.qty.value++;
                        // ignore: invalid_use_of_protected_member
                        controller.refresh();
                      }
                    },
                    icon: const Icon(
                      size: 35,
                      Icons.arrow_circle_right_outlined,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                enableFeedback: true,
                onTap: () {
                  controller.addCart(index, controller.qty.value);
                },
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: 55,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
