import 'package:bazar/controller/productview.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  final void Function() event;
  String text;
  final icon;
  Color color;
  Button(this.event, this.text, this.icon, this.color, {super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        enableFeedback: true,
        onTap: () {
          if (text.contains("Size")) {
            showBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerLeft,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Shoes Size's",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "cancle",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GetBuilder<Productcontroller>(
                      builder: (controller) {
                        return Container(
                          height: 700,
                          child: Obx(
                            () => ListView.builder(
                              itemCount: controller.sizes.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.selectedsize.value =
                                        controller.sizes[index];
                                    controller.refresh();
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 15,
                                    ),
                                    child: GetBuilder<Productcontroller>(
                                        builder: (controller) {
                                      return Obx(
                                        () => Text(
                                          "UK ${controller.sizes[index]}",
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            event();
          }
        },
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 60,
          width: 350,
          decoration: BoxDecoration(
            // color: Colors.grey.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
            ),
            color: color,
          ),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: color == Colors.black ? Colors.white : Colors.black,
                ),
              ),
              if (icon != null) icon
            ],
          ),
        ),
      ),
    );
  }
}
