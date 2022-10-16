// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../exports.dart';

class TopRatedMovies extends StatefulWidget {
  const TopRatedMovies({super.key});

  @override
  State<TopRatedMovies> createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  List<TopRatedMovie> topRatedData = [];
  void loadTopRatedMovies() async {
    topRatedData = await TopratedData().getTopRatedData();
    setState(() {});
  }

  @override
  void initState() {
    loadTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Rated Movies',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
          SizedBox(
            height: 5.w,
          ),
          Container(
            height: 50.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRatedData.length,
              itemBuilder: ((context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Descrisption(
                            name: topRatedData[index].name!,
                            description: topRatedData[index].description!,
                            bannerurl:
                                'https://image.tmdb.org/t/p/w500${topRatedData[index].bannerurl}',
                            posterurl:
                                'https://image.tmdb.org/t/p/w500${topRatedData[index].posterurl}',
                            lunchdate: topRatedData[index].lunchdate != null
                                ? topRatedData[index].lunchdate!
                                : 'Not Avialiable',
                            vote: topRatedData[index].vote!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 30.w,
                            width: 30.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${topRatedData[index].posterurl}'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          Text(
                            topRatedData[index].name!,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ));
              }),
            ),
          ),
        ],
      ),
    );
  }
}
