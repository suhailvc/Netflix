import 'dart:math';

import 'package:flutter/material.dart';

class DownloadScreenImage extends StatelessWidget {
  const DownloadScreenImage({
    super.key,
    required this.size,
    required this.image,
    required this.rotation,
    required this.margin,
  });

  final Size size;
  final String image;
  final double rotation;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation * pi / 180,
      child: Container(
        margin: margin,
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      ),
    );
  }
}
