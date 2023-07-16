import 'package:flutter/material.dart';
import 'package:netflix/domain/functions/functions.dart';
import 'package:netflix/presentation/widgets/maincardwidget.dart';
import '../../core/constants.dart';
import 'maintitlewidget.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  Future<List<dynamic>>? function;
  MainTitleCard({super.key, required this.title, this.function});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: MainTitlewidget(title: title),
      ),
      kheigth,
      LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
            future: function,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          snapshot.data!.length,
                          (index) => MainCardWidget(
                                image:
                                    "https://image.tmdb.org/t/p/w200${snapshot.data?[index].posterPath}",
                              )),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ))
    ]);
  }
}
