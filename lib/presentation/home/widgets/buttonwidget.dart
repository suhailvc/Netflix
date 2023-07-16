import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class MainscreenButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double textsize;
  final double iconsize;
  const MainscreenButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.textsize,
    required this.iconsize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: kwhite,
          size: iconsize,
        ),
      ),
      Text(
        title,
        style: TextStyle(fontSize: textsize),
      ),
    ]);
  }
}
