import 'dart:convert';
import 'dart:io';
import 'package:bazar/models/user.model.dart';
import 'package:bazar/service/Auth.service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Authcontroller extends GetxController {
  RxBool islogin = true.obs;

  Future<void> singup(String email, String fullname, String username,
      String phone, String password) async {
    final Map<String, String> body = {
      'fullname': fullname,
      'email': email,
      'username': username,
      'phone': phone,
      'password': password,
    };
    final res = await http.post(
      Uri.parse("${dotenv.env['URL']}/user/register"),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(body),
    );
    var response = json.decode(res.body);
    print(response['body']['phone']);
    await AuthService.setlogin(UserModel.fromJson(response['body']));
    print(AuthService.islogin());
    // return user;
  }

  bool login(String email, String password) {
    try {
      final res = http.post(
        Uri.parse("${dotenv.env['URL']}/user/login"),
        body: {
          email: email,
          password: password,
        },
      );
    } catch (err) {
      print(err);
      return false;
    }
    return true;
  }
}
