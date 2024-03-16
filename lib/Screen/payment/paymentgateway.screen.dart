import 'package:bazar/Screen/Cart/Cart.screen.dart';
import 'package:bazar/controller/cart.controller.dart';
import 'package:bazar/controller/payment.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Checklist extends StatelessWidget {
  CartController cartController;
  Checklist(this.cartController, {super.key});
  final PaymentController paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
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
                          width: 350,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.address.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 120,
                                // width: 350,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AddressText(
                                          controller.address[index]['Name'],
                                          Colors.black,
                                        ),
                                        AddressText(
                                          controller.address[index]['Address1'],
                                          Colors.grey,
                                        ),
                                        AddressText(
                                          controller.address[index]['phone'] ??
                                              "",
                                          Colors.grey,
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(5),
                                      onTap: () {},
                                      child: AddressText(
                                        "Update",
                                        Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
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
                          Container(
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
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                      ],
                    ),
                  );
                },
              ),
              
              HeadLine("Contact Info"),
              GetBuilder<PaymentController>(
                builder: (controller) {
                  return Container(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ContactInfo("Email", controller.Email),
                        ContactInfo("Phone no", controller.Phone),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 70,
                alignment: Alignment.center,
                child: Center(
                  child: InkWell(
                    enableFeedback: true,
                    onTap: () {},
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 70,
                      width: 350,
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                        border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Placeorder",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
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
          child: TextField(
            controller: Input,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
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
