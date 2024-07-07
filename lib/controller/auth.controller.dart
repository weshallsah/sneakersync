import 'dart:convert';
import 'dart:io';
import 'package:bazar/Screen/home/home.screen.dart';
import 'package:bazar/models/user.model.dart';
import 'package:bazar/service/Auth.service.dart';
import 'package:bazar/utils/Snack.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Authcontroller extends GetxController {
  RxBool islogin = true.obs;
  RxBool isloading = false.obs;

  Future<void> singup(
      String email,
      String fullname,
      String username,
      String phone,
      String password,
      GlobalKey<ScaffoldState> _scaffoldKey) async {
    isloading.value = true;
    final Map<String, String> body = {
      'fullname': fullname,
      'email': email,
      'username': username,
      'phone': phone,
      'password': password,
    };
    try {
      final res = await http.post(
        Uri.parse("${dotenv.env['URL']}/user/register"),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(body),
      );
      if (res.statusCode != 201) {
        switch (res.statusCode) {
          case 500:
            throw ("server error please try again");
          case 401:
            throw ("user alredy exits");
          default:
            throw ("some thing went wrong");
        }
        // print(res.statusCode);
      }
      var response = json.decode(res.body);
      await AuthService.setlogin(UserModel.fromJson(response['body']));
      isloading.value = false;
    } catch (error) {
      isloading.value = false;
      showtoast(_scaffoldKey, error.toString());
    }
  }

  Future<void> login(String username, String password,
      GlobalKey<ScaffoldState> _scaffoldKey) async {
    try {
      isloading.value = true;
      final Map<String, dynamic> body = {
        "username": username,
        "password": password,
      };
      final res = await http.post(
        Uri.parse("${dotenv.env['URL']}/user/login"),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode(body),
      );
      if (res.statusCode != 200) {
        throw ("something went wrong");
      }
      final response = json.decode(res.body);
      await AuthService.setlogin(UserModel.fromJson(response['body']));
      if (await AuthService.islogin()) {
        Get.offAll(Home());
      }
      isloading.value = false;
    } catch (err) {
      print(err);
      showtoast(_scaffoldKey, err.toString());
      isloading.value = false;
    }
  }
}
