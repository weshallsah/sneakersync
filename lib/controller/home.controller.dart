// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxMap page = {}.obs;
  RxBool isfocus = false.obs;
  RxBool dataget = false.obs;
  late RxList type = [].obs;
  late RxList brandname = [].obs;
  RxBool isLoading = false.obs;
  late RxMap product = {}.obs;
  Future<void> reloadproduct(String typename) async {
    print("loading");
    if (page.value[typename] == -1) {
      print("product over");
      isLoading.value = false;
      return;
    }
    page[typename]++;
    isLoading.value = true;
    final res = await http.get(
      Uri.parse(
          "${dotenv.env['URL']}/product/fetchproducts?page=${page[typename]}&type=${typename}"),
    );
    final response = await json.decode(res.body);
    print(response['body']);
    if (response['body'].length <= 0) {
      print("object");
      page.value[typename] = -1;
      isLoading.value = false;
      return;
    }
    await product[typename].addAll(response['body']);
    print(product[typename].length);
    product.refresh();
    isLoading.value = false;
  }

  @override
  Future<void> onReady() async {
    final brandres = await http
        .get(Uri.parse("${dotenv.env['URL']}/product/fetchbrandnames"));
    final brand = await json.decode(brandres.body);
    brandname.value = brand['body'];
    super.onReady();
    final res = await http.get(
      Uri.parse("${dotenv.env['URL']}/product/fetchproducttype"),
    );
    final response = await json.decode(res.body);
    print(response['body']);
    type.value = response['body'][0]['uniqueValues'];
  }

  Future<void> fetchproduct(String typename) async {
    // print("Function called for ${typename}");
    page[typename] = 1;
    final res = await http.get(Uri.parse(
        "${dotenv.env['URL']}/product/fetchproducts?page=${page[typename]}&type=${typename}"));
    final list = await json.decode(res.body);
    product[typename] = list['body'];
  }
}

// class Productcontroller extends GetxController {
//   final typename;
//   RxInt page = 1.obs;
//   Productcontroller(this.typename);
//   RxList product = [].obs;
//   Future<void> fetchproduct() async {
//     print("Function called for ${typename}");
//     final res = await http.get(Uri.parse(
//         "${dotenv.env['URL']}/product/fetchproducts?page=${page}&type=${typename}"));
//     final list = await json.decode(res.body);
//     product.value = list['body'];
//     refresh();
//   }

//   @override
//   Future<void> onReady() async {
//     // TODO: implement onReady
//     super.onReady();
//     await fetchproduct();
//   }
// }
