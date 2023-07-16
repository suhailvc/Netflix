import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoCardWidget extends StatelessWidget {
  final String image;
  const VideoCardWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: kblackcolor.withOpacity(0.5),
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_outlined,
                color: kwhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
