import 'dart:convert';
import 'dart:io';

import 'package:bazar/Screen/payment/Checklist.payment.dart';
import 'package:bazar/service/Auth.service.dart';
import 'package:bazar/utils/Snack.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  RxBool addresssheet = true.obs;
  RxInt selected = 0.obs;
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();
  List details = [
    "Name",
    "Socity/colony/Room-No",
    "Street Name",
    "LandMark",
    "pincode",
    "city",
    "state",
    "country"
  ];
  List TextController = List.generate(8, (index) => TextEditingController());

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
    for (int i = 0; i < details.length; i++) {
      TextController[i].text = "";
    }
    if (json.decode(res.body)['body'] != null) {
      address.add(json.decode(res.body)['body']);
      address.refresh();
    }
    // print(json.decode(res.body)['body']);
  }

  late final paymentIntent;
  Future<void> makePayment() async {
    try {
      paymentIntent = await createpayment('100', 'USD');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  billingDetails: BillingDetails(
                    name: address[selected.value]['Name'],
                    email: Email.text,
                    phone: Phone.text,
                    address: Address(
                        city: address[selected.value]['city'],
                        country: address[selected.value]['city'],
                        line1:
                            "${address[selected.value]['Socity/colony/Room-No']} ${address[selected.value]['LandMark']}",
                        line2: address[selected.value]['Street Name'],
                        postalCode: address[selected.value]['pincode'],
                        state: address[selected.value]['state']),
                  ),
                  paymentIntentClientSecret:
                      paymentIntent!['${user.id}'], //Gotten from payment intent
                  style: ThemeMode.system,
                  merchantDisplayName: 'sneakersync'))
          .then((value) {});
      // goto payment
      // print(paymentIntent);
      await Stripe.instance.presentPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }

  createpayment(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET_KEY']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
