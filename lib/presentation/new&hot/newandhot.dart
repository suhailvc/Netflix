import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/domain/functions/functions.dart';
import 'package:netflix/presentation/new&hot/widgets/comingsoonwidget.dart';
import 'package:netflix/presentation/new&hot/widgets/everyoneswhatchingwidget.dart';
import '../../core/constants.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
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
            bottom: TabBar(
                labelColor: kblackcolor,
                isScrollable: true,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                unselectedLabelColor: kwhite,
                indicator:
                    BoxDecoration(color: kwhite, borderRadius: kradius30),
                tabs: const [
                  Tab(text: "🍿coming soon"),
                  Tab(
                    text: "👀Everyone's Whatching",
                  )
                ]),
          ),
        ),
        body: TabBarView(children: [
          _builComingsoon(moviesList(
              'https://api.themoviedb.org/3/movie/now_playing?api_key=d14b2be3a7c3086b86928c0671f6414c')),
          _buildEveryonsWhatching(moviesList(
              'https://api.themoviedb.org/3/movie/now_playing?api_key=d14b2be3a7c3086b86928c0671f6414c'))
        ]),
      ),
    );
  }
}

Widget _builComingsoon(Future<List<dynamic>>? comingSoonFunction) {
  List<String> dates = [
    '5',
    '12',
    '15',
    '6',
    '10',
    '26',
    '5',
    '12',
    '15',
    '6',
    '10'
  ];
  List<String> months = [
    'Mar',
    'Jun',
    'Jan',
    'Dec',
    'Mar',
    'Aug',
    'Apr',
    'Mar',
    'Jun',
    'May',
    'Mar'
  ];

  return FutureBuilder(
    future: comingSoonFunction,
    builder: (context, snapshot) {
      return ListView.builder(
        itemCount: 11,
        itemBuilder: (context, index) {
          return snapshot.hasData
              ? ComingSoonWidget(
                  date: dates[index],
                  month: months[index],
                  imagePath:
                      "https://image.tmdb.org/t/p/w200${snapshot.data?[index].backdropPath}",
                  description: snapshot.data?[index].overview,
                  movieTitle: snapshot.data?[index].originalTitle,
                  releaseDate: snapshot.data?[index].releaseDate)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      );
    },
  );
}

Widget _buildEveryonsWhatching(Future<List<dynamic>>? watchingFunction) {
  return FutureBuilder(
    future: watchingFunction,
    builder: (context, snapshot) {
      return snapshot.hasData
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => EveryOnesWhatchingwidget(
                    description: snapshot.data?[index].overview,
                    imagePath:
                        "https://image.tmdb.org/t/p/w200${snapshot.data?[index].backdropPath}",
                    movieTitle: snapshot.data?[index].originalTitle,
                  ))
          : Center(
              child: CircularProgressIndicator(),
            );
    },
  );
}
