import 'dart:convert';

import 'package:bazar/service/Auth.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();
  RxList address = [].obs;
  late final user;
  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    print(address.length);
    user = await AuthService.getuser();
    final res = await http.get(
      Uri.parse("${dotenv.env["URL"]}/address/getadress?user=${user.id}"),
    );
    address.value = json.decode(res.body)['payload'];
    Email.text = address[0]['Email'];
    Phone.text = address[0]['phone'];
  }
}
