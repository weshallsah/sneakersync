// import 'package:bazar/models/Product.models.dart';
import 'dart:convert';
import 'package:bazar/service/Auth.service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  late final user;
  RxList product = [].obs;
  RxBool isloading = false.obs;
  RxInt total = 0.obs;
  RxInt qty = 0.obs;
  @override
  void onReady() async {
    super.onReady();
    user = await AuthService.getuser();
    // print(user.username);
    isloading.value = true;
    final res = await http.get(
      Uri.parse("${dotenv.env['URL']}/cart/getcart?userID=${user.id}"),
    );
    final response = json.decode(res.body);
    // print(response['body']);
    product.value = response['body'];
    for (int i = 0; i < product.length; i++) {
      total += (product[i]['cartproduct']['price'] * product[i]['qty']);
    }
    isloading.value = false;
  }

  void addCart(int index, int qunty) async {
    // print(user);
    product[index]['qty'] = qunty;
    total.value = 0;
    for (int i = 0; i < product.length; i++) {
      total += (product[i]['cartproduct']['price'] * product[i]['qty']);
    }
    // print(product[index]['_id']);
    final res = await http.get(
      Uri.parse(
          "${dotenv.env['URL']}/cart/updatecart?docID=${product[index]['_id']}&qty=${qunty}"),
    );
    if (qunty == 0 && json.decode(res.body)['payload']['acknowledged']) {
      product.remove(product[index]);
    }
    // print(json.decode(res.body));
    Get.back();
    product.refresh();
  }
}
