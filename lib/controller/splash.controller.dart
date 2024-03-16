import 'package:bazar/Screen/home/home.screen.dart';
import 'package:bazar/Screen/splash/splash.screen.dart';
import 'package:bazar/component/servererror.component.dart';
import 'package:bazar/service/Auth.service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SplashController extends GetxController {
  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    // final res = await http.get(
    //   Uri.parse("${dotenv.env['URL']}/"),
    // );
    // print(res.statusCode);
    // if (res.statusCode == 200) {
      await Future.delayed(Duration(seconds: 1)).then((value) async {
        if (await AuthService.islogin()) {
          Get.offAll(Home());
        } else {
          Get.offAll(Landing());
        }
      });
    // } else {
      // Get.offAll(ServerErrorPage());
    // }
  }
}
