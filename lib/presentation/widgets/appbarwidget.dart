import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            size: 30,
            color: Colors.white,
          ),
          kwidth,
          SizedBox(
            height: 30,
            width: 30,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/images/Netflix-avatar.png')),
          ),
          kwidth
        ],
      ),
    );
  }
}
