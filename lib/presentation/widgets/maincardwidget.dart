import 'package:flutter/material.dart';

class MainCardWidget extends StatelessWidget {
  String image;
  MainCardWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 180,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      ),
    );
  }
}
