// ignore_for_file: must_be_immutable

import 'dart:ffi';

import 'package:bazar/Screen/Cart/Cart.screen.dart';
import 'package:bazar/component/Button.component.dart';
import 'package:bazar/controller/cart.controller.dart';
import 'package:bazar/controller/payment.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/state_manager.dart';

class Address extends StatelessWidget {
  CartController cartController;
  Address(this.cartController, {super.key});
  final PaymentController paymentController = Get.put(PaymentController());
  GlobalKey<ScaffoldState> _formKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: Text("Sneakersync"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CartPage());
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // MRP
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Checkout products",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "MRP :${cartController.total} \$",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  HeadLine("Which address would you like to Receive Order"),
                  Container(
                    height: 70,
                    width: 350,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.delivery_dining_outlined,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Deliver It",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  HeadLine("Enter your name and address :"),
                  GetBuilder<PaymentController>(
                    builder: (controller) {
                      return Obx(
                        () => Column(
                          children: [
                            Container(
                              width: 360,
                              child: ListView.builder(
                                padding: const EdgeInsets.all(0),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.address.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 350,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            controller.selected.value = index;
                                            controller.refresh();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 25,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AddressText(
                                                      controller.address[index]
                                                          ['Name'],
                                                      Colors.black,
                                                    ),
                                                    AddressText(
                                                      controller.address[index]
                                                          ['Address1'],
                                                      Colors.grey,
                                                    ),
                                                    AddressText(
                                                      controller.address[index]
                                                              ['phone'] ??
                                                          "",
                                                      Colors.grey,
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  onTap: () {},
                                                  child: AddressText(
                                                    "Update",
                                                    Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (controller.selected == index)
                                        Positioned(
                                          right: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                25,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons
                                                  .check_circle_outline_rounded,
                                              size: 35,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            if (controller.address.length != 0)
                              const SizedBox(
                                height: 10,
                              ),
                            if (controller.address.length != 0) const Line(),
                            if (controller.address.length != 0)
                              InkWell(
                                onTap: () {
                                  controller.addresssheet.value = true;
                                },
                                child: Container(
                                  width: 180,
                                  height: 60,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    border: Border.all(
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 30,
                                      ),
                                      Text(
                                        "Add New Address",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  GetBuilder<PaymentController>(
                    builder: (controller) {
                      return Obx(() {
                        if (controller.address.length == 0) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            child: FromField(controller, false),
                          );
                        } else {
                          return Container();
                        }
                      });
                    },
                  ),

                  GetBuilder<PaymentController>(
                    builder: (controller) {
                      return Obx(
                        () => Column(
                          children: [
                            if (controller.address.length != 0)
                              HeadLine("Contact Info"),
                            if (controller.address.length != 0)
                              Container(
                                height: 170,
                                width: 350,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: FromField(controller, true),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Button(
                    () {
                      paymentController.placeordered(_formKey);
                    },
                    "Placeorder",
                    null,
                    Colors.transparent,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
          GetBuilder<PaymentController>(builder: (controller) {
            return Obx(
              () => controller.addresssheet.value
                  ? Container()
                  : AddressSheet(paymentController),
            );
          }),
        ],
      ),
    );
  }
}

class AddressSheet extends StatelessWidget {
  PaymentController paymentController;
  AddressSheet(this.paymentController, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.medium3,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 2,
        // horizontal: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // color: Colors.amber,
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      paymentController.addresssheet.value = false;
                      paymentController.refresh();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Text(
                    "Add address",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: FromField(paymentController, false),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Button(
                () {},
                "Add",
                null,
                Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FromField extends StatelessWidget {
  PaymentController controller;
  bool iscontect;
  FromField(this.controller, this.iscontect, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (!iscontect)
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.details.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ContactInfo(controller.details[index],
                    controller.TextController[index]),
              );
            },
          ),
        if (!iscontect)
          SizedBox(
            height: 5,
          ),
        ContactInfo("Phone", controller.Phone),
        SizedBox(
          height: 10,
        ),
        ContactInfo("Email", controller.Email),
      ],
    );
  }
}

class HeadLine extends StatelessWidget {
  String text;
  HeadLine(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  String text1;
  TextEditingController Input;
  ContactInfo(this.text1, this.Input, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          // color: Colors.amber,
          height: 30,
          child: TextFormField(
            controller: Input,
            textInputAction: TextInputAction.next,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            validator: (value) {
              if (value == null && value!.trim().isEmpty) {
                return "please enter the detail";
              } else {
                return null;
              }
            },
          ),
        )
      ],
    );
  }
}

class AddressText extends StatelessWidget {
  String text;
  Color color;
  AddressText(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: color,
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "OR",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
