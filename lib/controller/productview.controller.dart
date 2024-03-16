import 'dart:convert';
import 'dart:io';
import 'package:bazar/service/Auth.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;

class Productcontroller extends GetxController {
  final id;
  late final user;
  // final user = AuthService.getuser();
  Productcontroller(this.id);
  late RxMap data = {}.obs;
  RxInt selectedsize = 10.obs;
  RxList sizes = [7, 8].obs;
  RxBool isloaded = false.obs;
  @override
  Future<void> onReady() async {
    super.onReady();
    user = await AuthService.getuser();
    final res = await http.get(
      Uri.parse(
          "${dotenv.env['URL']}/product/fetchproduct?id=${id}&user=${user?.id}"),
    );
    final response = json.decode(res.body);
    data.value = response['body'][0];
    print(data.value);
    isloaded.value = true;
    // Get.back();
  }

  Future<void> addtocart() async {
    // final user = await AuthService.getuser();
    // print(user?.id);
    final Map<String, dynamic> body = {
      "user": user?.id,
      "product": data['_id'],
      "size": selectedsize.value,
    };
    print(body);
    // print(json.encode(body));
    final res = await http.post(
      Uri.parse("${dotenv.env['URL']}/cart/addcart"),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(body),
    );
    // print(res.statusCode);
    if (res.statusCode == 200) {
      const SnackBar(content: Text("product add to cart successfully"));
    }
    // return true;
  }

  Future<void> addtowishlist() async {
    // final user = await AuthService.getuser();
    final res = await http.get(
      Uri.parse(
          "${dotenv.env['URL']}/wishlist/addtowishlist?user=${user?.id}&product=${data['_id']}"),
    );
    // pr int(res.statusCode);
    if (res.statusCode == 200) {
      data['fav'] = true;
      refresh();
      const SnackBar(content: Text("product add to cart successfully"));
    }
  }

  void sizesheet(BuildContext context) {
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
  }
}
