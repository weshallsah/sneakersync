import 'package:flutter/material.dart';

class Saliding extends StatelessWidget {
  const Saliding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.2115,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Card(
              elevation: 1,
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: MediaQuery.sizeOf(context).width * 0.9,
                alignment: Alignment.center,
                child: Text(
                  "Image",
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
