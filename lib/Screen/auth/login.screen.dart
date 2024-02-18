import 'package:bazar/Screen/auth/register.screen.dart';
import 'package:bazar/controller/auth.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final password = TextEditingController();
  final username = TextEditingController();
  final Authcontroller authcontroller = Get.put(Authcontroller());
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'LOG IN',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            child: Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey[800],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            child: Text(
              "enter password to get back your account!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[600],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blueGrey[100],
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    height: 30,
                    'assets/SVG/google.svg',
                  ),
                  Text(
                    "Continue With Google",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: username,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        labelText: 'username',
                        hintText: '',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          labelText: 'Password',
                          hintText: 'Enter secure password'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO FORGOT PASSWORD SCREEN GOES HERE
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                  GetBuilder<Authcontroller>(builder: (context) {
                    if (authcontroller.isloading.value) {
                      return CircularProgressIndicator();
                    }
                    return CupertinoButton(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                      onPressed: () async {
                        await authcontroller.login(
                            username.text, password.text, _scaffoldKey);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    );
                  }),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('New User?'),
                        GetBuilder<Authcontroller>(
                          builder: (controller) => TextButton(
                            onPressed: () {
                              Get.to(
                                singup(authcontroller),
                              );
                            },
                            child: Text(
                              "Create Account",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
