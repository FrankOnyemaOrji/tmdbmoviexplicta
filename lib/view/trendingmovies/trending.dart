// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../exports.dart';

class Trending extends StatefulWidget {
  const Trending({
    super.key,
  });

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  List<TrendingMovies> trendingData = [];
  void loadtrendingData() async {
    trendingData = await TrendingData().getTrendingData();
    setState(() {});
  }

  @override
  void initState() {
    loadtrendingData();
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
            'Trending Movies And Tv Shows',
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
              itemCount: trendingData.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Descrisption(
                              name: trendingData[index].name!,
                              description: trendingData[index].description!,
                              bannerurl:
                                  'https://image.tmdb.org/t/p/w500${trendingData[index].bannerurl}',
                              posterurl:
                                  'https://image.tmdb.org/t/p/w500${trendingData[index].posterurl}',
                              vote: trendingData[index].vote!,
                              lunchdate: trendingData[index].lunchdate != null
                                  ? trendingData[index].lunchdate!
                                  : 'Not Avialiable'),
                        ),
                      );
                    },
                    child: Container(
                      width: 35.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(trendingData[index].posterurl != null ?
                              'https://image.tmdb.org/t/p/w500${trendingData[index].posterurl}' : 'Image Not Avialiable'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // child: Column(
                      //   children: [
                      //     Text(
                      //       trendingData[index].name != null
                      //           ? trendingData[index].name!
                      //           : "Not loding name",
                      //       style: TextStyle(
                      //           fontSize: 15.sp,
                      //           fontWeight: FontWeight.w400,
                      //           color: Colors.white),
                      //     ),
                      //   ],
                      // ),
                    ),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
