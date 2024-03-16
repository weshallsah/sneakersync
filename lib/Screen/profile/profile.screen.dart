import 'package:bazar/Screen/myorder/myorder.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "My Profile",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/SVG/avatar.svg',
                ),
                const SizedBox(
                  width: 15,
                ),
                DoubleText("weshallsah", "vishalk74064@gmail.com", true),
              ],
            ),
            ProfileButtons("My Orders", "Alredy have 12 order"),
            ProfileButtons("Shiping Adresse", "there are 3 address's"),
            ProfileButtons("wishlist", "wishlist have 0 items"),
            ProfileButtons("gift Card", "see your gift cards"),
            ProfileButtons("My Review", "Reviewed items"),
            ProfileButtons("Settings", "Edit profile,password etc"),
          ],
        ),
      ),
    );
  }
}

class DoubleText extends StatelessWidget {
  String text1, text2;
  bool isprofilename;
  DoubleText(this.text1, this.text2, this.isprofilename);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: 20,
            fontWeight: isprofilename ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isprofilename ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class ProfileButtons extends StatelessWidget {
  String text1, text2;
  ProfileButtons(this.text1, this.text2);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: InkWell(
        onTap: () {
          Get.to(MyOrder());
        },
        child: Container(
          alignment: Alignment.center,
          height: 60,
          // margin: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DoubleText(text1, text2, false),
              const Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
