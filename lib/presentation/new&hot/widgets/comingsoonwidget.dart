import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/buttonWidget.dart';
import 'package:netflix/presentation/widgets/videowidget.dart';

import '../../../core/colors/colors.dart';

class ComingSoonWidget extends StatelessWidget {
  String description;
  String movieTitle;
  String releaseDate;
  String imagePath;
  String month;
  String date;
  ComingSoonWidget(
      {super.key,
      required this.description,
      required this.movieTitle,
      required this.releaseDate,
      required this.imagePath,
      required this.date,
      required this.month});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              month,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: kgreycolor),
            ),
            Text(
              date,
              style: const TextStyle(
                  fontSize: 30, letterSpacing: 5, fontWeight: FontWeight.bold),
            )
          ]),
        ),
        SizedBox(
          height: 550,
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoCardWidget(image: imagePath),
              kheigth,
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      movieTitle,
                      style: GoogleFonts.itim(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -2),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      MainscreenButtonWidget(
                        icon: Icons.add_alert_rounded,
                        title: 'Remaind me',
                        textsize: 10,
                        iconsize: 20,
                      ),
                      kwidth,
                      MainscreenButtonWidget(
                        icon: Icons.info,
                        title: 'Info',
                        textsize: 10,
                        iconsize: 20,
                      ),
                      kwidth
                    ],
                  )
                ],
              ),
              kheigth,
              const Text('Coming on Friday'),
              kheigth,
              Text(
                movieTitle,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              kheigth,
              Text(
                description,
                style: const TextStyle(color: kgreycolor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
