import 'package:bazar/Screen/profile/profile.screen.dart';
import 'package:bazar/component/BrandName.component.dart';
import 'package:bazar/component/Saliding.component.dart';
import 'package:bazar/component/homeHeader.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sneakersync"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(Profile());
            },
            icon: Icon(
              Icons.person,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.explore,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.1,
            child: HeaderPage(),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.07,
            child: BrandName(),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.711,
            // color: Colors.amber,
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Saliding(),
                  SizedBox(
                    height: 15,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {},
                        child: Card(
                          elevation: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      );
                    },
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
