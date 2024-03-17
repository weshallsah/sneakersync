import 'dart:convert';
import 'dart:io';

import 'package:bazar/Screen/payment/Checklist.payment.dart';
import 'package:bazar/service/Auth.service.dart';
import 'package:bazar/utils/Snack.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();
  List details = [
    "Name",
    "Socity/colony/Room-No",
    "Street Name",
    "LandMark",
    "pincode",
    "state",
    "country"
  ];
  List TextController = List.generate(7, (index) => TextEditingController());

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
    address.value = json.decode(res.body)['body'];
    if (address.length != 0) {
      Email.text = address[0]['Email'];
      Phone.text = address[0]['phone'];
    }
    print(address.length);
  }

  void placeordered(GlobalKey<ScaffoldState> _scaffoldKey) async {
    if (address.length == 0) {
      addAddress(_scaffoldKey, true);
    } else {
      Get.to(
        () => Checklist(),
      );
    }
  }

  void addAddress(
      GlobalKey<ScaffoldState> _scaffoldKey, bool isplaceorder) async {
    if (Email.text.trim() == "" || Phone.text.trim() == "") {
      showtoast(_scaffoldKey, "please enter detail");
      return;
    }
    for (int i = 0; i < details.length; i++) {
      if (TextController[i].text.trim() == "") {
        showtoast(_scaffoldKey, "please enter detail");
        return;
      }
    }
    Map body = {
      "phone": Phone.text,
      "Email": Email.text,
    };
    for (int i = 0; i < details.length; i++) {
      if (i >= 1 && i <= 3) {
        body["Address${i}"] = TextController[i].text;
      } else {
        body[details[i]] = TextController[i].text;
      }
    }
    body['user'] = user.id;
    // print(json.encode(body));
    Get.to(() => Checklist());
    final res = await http.post(
      Uri.parse("${dotenv.env["URL"]}/address/addadress"),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(body),
    );
    if (json.decode(res.body)['body'] != null) {
      address.add(json.decode(res.body)['body']);
      address.refresh();
    }
    // print(json.decode(res.body)['body']);
  }
}
