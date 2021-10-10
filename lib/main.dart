// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:moviexplicta/widget/popularshows.dart';
import 'package:moviexplicta/widget/toprated.dart';
import 'package:moviexplicta/widget/trending.dart';
import 'package:moviexplicta/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

void main() {
  runApp(Moviexplicta());
}

class Moviexplicta extends StatelessWidget {
  const Moviexplicta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        home: _HomeScreen(),
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
      );
    });
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  __HomeScreenState createState() => __HomeScreenState();
}

class __HomeScreenState extends State<_HomeScreen> {
  List topratedmovies = [];
  List trendingmovies = [];
  List tv = [];
  // bool loading = true;

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  final String apikey = '3d8167986635e347263c13dc4a498839';
  Future<http.Response> movieAlbum() {
    return http.get(Uri.parse(apikey));
  }

  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZDgxNjc5ODY2MzVlMzQ3MjYzYzEzZGM0YTQ5ODgzOSIsInN1YiI6IjYxNGM5MGI5ZDU1YzNkMDA2NzQ5ZjVlOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BzGQDIJ7FhTAKzcuyfBPFn9q6IbbfihUAb7XaKB2pe';

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendinResults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResults = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      trendingmovies = trendinResults['results'];
      topratedmovies = topRatedResults['results'];
      tv = tvResults['results'];
      // loading = false;
    });

    print('torated:$topratedmovies');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: modified_Text(
            text: ('Moviexplicta ❤️️'),
            color: Colors.white,
            size: 25.0,
          )),
      body: ListView(
        children: [
          PopularTvShows(Tv: tv),
          topRatedMovies(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),
        ],
      ),
    );
  }
}
