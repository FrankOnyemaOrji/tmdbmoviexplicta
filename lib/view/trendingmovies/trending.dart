// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../cubit/trendingmovies/trendingmovies_cubit.dart';
import '../exports.dart';

class Trending extends StatefulWidget {
  const Trending({
    super.key,
  });

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  void loadTrendingMovies() async {
    final LoadingMovies = BlocProvider.of<TrendingmoviesCubit>(context);
    final movieList = await TrendingData().getTrendingData();
    LoadingMovies.trendingMovies(movieList);
  }

  @override
  void initState() {
    loadTrendingMovies();
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
            child: BlocBuilder<TrendingmoviesCubit, TrendingmoviesState>(
              builder: (context, state) {
                final List<TrendingMovies> trendingMovies =
                    state.trendingMovies;
                if (state is GetTrendingMovies){
                  return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingMovies.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Descrisption(
                                name: trendingMovies[index].name!,
                                description: trendingMovies[index].description!,
                                bannerurl:
                                    'https://image.tmdb.org/t/p/w500${trendingMovies[index].bannerurl}',
                                posterurl:
                                    'https://image.tmdb.org/t/p/w500${trendingMovies[index].posterurl}',
                                vote: trendingMovies[index].vote!,
                                lunchdate: trendingMovies[index].lunchdate != null
                                    ? trendingMovies[index].lunchdate!
                                    : 'Not Avialiable'),
                          ),
                        );
                      },
                      child: Container(
                        width: 35.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(trendingMovies[index].posterurl !=
                                    null
                                ? 'https://image.tmdb.org/t/p/w500${trendingMovies[index].posterurl}'
                                : 'Image Not Avialiable'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              trendingMovies[index].name != null
                                  ? trendingMovies[index].name!
                                  : "Not loding name",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
                }
                else{
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
