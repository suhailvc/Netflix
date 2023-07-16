import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/widgets/playbuttonwidget.dart';
import 'package:netflix/presentation/home/widgets/buttonwidget.dart';

class BackGroundCardWidget extends StatelessWidget {
  Future<List<dynamic>>? bgFunction;
  BackGroundCardWidget({super.key, required this.bgFunction});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: bgFunction,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Container(
                    height: 600,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w200${snapshot.data?[2].posterPath}"),
                            fit: BoxFit.cover)),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                MainscreenButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                  textsize: 17,
                  iconsize: 30,
                ),
                PlayButton(),
                MainscreenButtonWidget(
                  icon: Icons.info,
                  title: 'Info',
                  textsize: 17,
                  iconsize: 30,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
