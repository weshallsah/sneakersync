// import 'package:bazar/controller/productview.controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MyWidget extends StatelessWidget {
//   Productcontroller productcontroller;
//   MyWidget(this.productcontroller, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return showBottomSheet(
//       context: context,
//       builder: (context) {},
//     );
//   }
// }
// showBottomSheet(
//         context: context,
//         builder: (context) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 15),
//                 alignment: Alignment.centerLeft,
//                 height: 60,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "Shoes Size's",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text(
//                         "cancle",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               GetBuilder<Productcontroller>(builder: (controller) {
//                 return Container(
//                   height: 700,
//                   child: Obx(
//                     () => ListView.builder(
//                       itemCount: controller.sizes.length,
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () {
//                             controller.selectedsize.value =
//                                 controller.sizes[index];
//                             controller.refresh();
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(
//                               horizontal: 15,
//                               vertical: 15,
//                             ),
//                             child: GetBuilder<Productcontroller>(
//                                 builder: (controller) {
//                               return Obx(
//                                 () => Text(
//                                   "UK ${controller.sizes[index]}",
//                                   style: const TextStyle(
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               );
//                             }),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 );
//               }),
//             ],
//           );
//         },
      // ),