import 'package:bazar/controller/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandName extends StatelessWidget {
  final HomeController homeController;
  const BrandName({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.brandname.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                if (index == 0)
                  SizedBox(
                    width: 25,
                  ),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {},
                  child: Card(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        controller.brandname[index]['brand_name'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            );
          },
        ),
      );
    });
  }
}
