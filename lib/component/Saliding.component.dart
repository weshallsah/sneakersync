// import 'package:bazar/component/Loading.component.dart';
// import 'package:bazar/controller/home.controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Saliding extends StatelessWidget {
//   final HomeController homeController;
//   const Saliding(this.homeController, {super.key});
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.sizeOf(context).height * 0.2115,
//       child: GetBuilder<HomeController>(builder: (context) {
//         return ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: homeController.list.length,
//           itemBuilder: (context, index) {
//             return HightLigthCard(url: homeController.list[index]['image']);
//           },
//         );
//       }),
//     );
//   }
// }

// class HightLigthCard extends StatelessWidget {
//   // ignore: prefer_typing_uninitialized_variables
//   final url;
//   const HightLigthCard({super.key, this.url});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(15),
//       onTap: () {},
//       child: Card(
//         elevation: 1,
//         child: Container(
//           decoration: BoxDecoration(
//             // color: Colors.amber,
//             borderRadius: BorderRadius.circular(15),
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: NetworkImage(url),
//             ),
//           ),
//           width: MediaQuery.sizeOf(context).width * 0.9,
//           alignment: Alignment.center,
//         ),
//       ),
//     );
//   }
// }
