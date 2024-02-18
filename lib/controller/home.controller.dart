import 'dart:convert';

import 'package:bazar/models/Product.models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxBool isdataloaded = false.obs;
  RxBool dataget = false.obs;
  late RxList list = [].obs;
  @override
  Future<List> onReady() async {
    // late List<Product> list = [];
    // TODO: implement onInit
    super.onReady();
    final res =
        await http.get(Uri.parse("${dotenv.env['URL']}/product/fetchproduct"));
    final response = await json.decode(res.body);
    list.value = response['body'];
    // print(response['body'][0]);
    isdataloaded.value = true;
    refresh();
    // return list;
    return response['body'];
  }
}
