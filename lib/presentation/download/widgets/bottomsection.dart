import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class SectionBottom extends StatelessWidget {
  const SectionBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              height: 45,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: kbuttonblue,
              onPressed: () {},
              child: const Text(
                'Set up',
                style: TextStyle(
                    color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheigth,
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: MaterialButton(
            height: 45,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kwhite,
            onPressed: () {},
            child: const Text(
              'See What You can Download',
              style: TextStyle(
                  color: kblackcolor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
