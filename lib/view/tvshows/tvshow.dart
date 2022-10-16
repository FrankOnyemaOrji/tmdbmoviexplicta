// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../exports.dart';

class PopularTvShows extends StatefulWidget {
  const PopularTvShows({super.key});

  @override
  State<PopularTvShows> createState() => _PopularTvShowsState();
}

class _PopularTvShowsState extends State<PopularTvShows> {
  List<PopularTvShow> popularTvShows = [];
  void loadPopularTvShows() async {
    popularTvShows = await TvShowData().geTvShowData();
    setState(() {});
  }

  @override
  void initState() {
    loadPopularTvShows();
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
            'Popular Tv Shows',
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
              itemCount: popularTvShows.length,
              itemBuilder: ((context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Descrisption(
                            name: popularTvShows[index].name!,
                            description: popularTvShows[index].description!,
                            bannerurl:'https://image.tmdb.org/t/p/w500${popularTvShows[index].bannerurl}',
                            posterurl: 'https://image.tmdb.org/t/p/w500${popularTvShows[index].posterurl}',
                            vote: popularTvShows[index].vote!,
                            lunchdate: popularTvShows[index].lunchdate != null
                                ? popularTvShows[index].lunchdate!
                                : 'Not Avialiable',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            width: 30.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(popularTvShows[index]
                                            .posterurl !=
                                        null
                                    ? 'https://image.tmdb.org/t/p/w500${popularTvShows[index].posterurl}'
                                    : 'Image Not Avialiable'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          Text(
                            popularTvShows[index].name!,
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
          )
        ],
      ),
    );
  }
}
