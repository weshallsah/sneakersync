import 'package:bazar/Screen/Cart/Cart.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 25,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enjoy New Nike",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              Text(
                "Products",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            Get.to(() => CartPage());
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                image: AssetImage("assets/bag.png"),
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Text(
              "+9",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
