import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhite)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          color: kblackcolor,
          size: 30,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(
                fontSize: 20, color: kblackcolor, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
