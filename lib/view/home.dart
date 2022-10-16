import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff071a52),
      appBar: AppBar(
        backgroundColor: const Color(0xff071a52).withOpacity(0.1),
        title: Text(
          'Moviexplicta ❤️️',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.0.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: const [
          Trending(),
          SizedBox(
            height: 10,
          ),
          PopularTvShows(),
          SizedBox(
            height: 10,
          ),
          TopRatedMovies(),
        ],
      ),
    );
  }
}
