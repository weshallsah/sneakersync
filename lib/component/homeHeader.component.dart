import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            margin: const EdgeInsets.only(
              left: 25,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enjoy New Nike",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                Text(
                  "Products",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            enableFeedback: true,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            onTap: () {},
            child: Card(
              margin: const EdgeInsets.all(0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color: Colors.blueGrey[200],
                ),
                child: SvgPicture.asset('assets/SVG/filter.svg'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
