import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/functions/functions.dart';
import 'package:netflix/presentation/search/searchscreen.dart';
import 'package:netflix/presentation/search/widgets/searchtitle.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheigth20,
        Expanded(
            child: FutureBuilder(
          future: getimageSearchGrid(searchControllor.text.trim()),
          builder: (context, snapshot) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.4,
              children: List.generate(
                snapshot.data!.length,
                (index) {
                  return snapshot.hasData
                      ? MainCard(
                          image:
                              'https://image.tmdb.org/t/p/w200${snapshot.data?[index].posterPath}',
                          index: index,
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            );
          },
        )),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  String image;
  final int index;
  MainCard({super.key, required this.index, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
