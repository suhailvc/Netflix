import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/functions/functions.dart';
import 'package:netflix/presentation/search/widgets/searchtitle.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kheigth,
        Expanded(
            child: FutureBuilder(
          future: moviesList(
              'https://api.themoviedb.org/3/movie/top_rated?api_key=d14b2be3a7c3086b86928c0671f6414c'),
          builder: (context, snapshot) {
            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => TopSearchItemTile(
                    image:
                        "https://image.tmdb.org/t/p/w200${snapshot.data?[index].backdropPath}",
                    index: index,
                    movieName:
                        snapshot.data?[index].originalTitle ?? 'Unknown'),
                separatorBuilder: (context, index) => kheigth20,
                itemCount: 10);
          },
        )),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  String movieName;
  String image;
  TopSearchItemTile(
      {super.key,
      required this.index,
      required this.movieName,
      required this.image});
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * 0.4,
          height: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
        ),
        kwidth,
        Expanded(
            child: Text(
          movieName,
          style: const TextStyle(
              color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
        )),
        const CircleAvatar(
            backgroundColor: kwhite,
            radius: 25,
            child: Icon(
              Icons.play_circle_fill,
              color: kblackcolor,
              size: 50,
            ))
      ],
    );
  }
}
