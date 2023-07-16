import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

import '../../../core/colors/colors.dart';

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhite,
        ),
        kwidth,
        Text('Smart Downloads')
      ],
    );
  }
}
