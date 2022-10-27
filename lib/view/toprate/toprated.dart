// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/toprated/toprated_cubit.dart';
import '../exports.dart';

class TopRatedMovies extends StatefulWidget {
  const TopRatedMovies({super.key});

  @override
  State<TopRatedMovies> createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
void loadMovies() async{
  final LoadingMovies = BlocProvider.of<TopratedCubit>(context);
  final movieList = await TopratedData().getTopRatedData();
  LoadingMovies.topRate(movieList);
}
  @override
  void initState() {
    loadMovies();
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
            child: BlocBuilder<TopratedCubit, TopratedState>(
              builder: (context, state) {
                final List<TopRatedMovie> topRatedMovies = state.topRatedMovies;
                if (state is GetTopRatedMovies) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topRatedMovies.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                  value:
                                      BlocProvider.of<TopratedCubit>(context),
                                  child: Descrisption(
                                    name: topRatedMovies[index].name!,
                                    description:
                                        topRatedMovies[index].description!,
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500${topRatedMovies[index].bannerurl}',
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500${topRatedMovies[index].posterurl}',
                                    lunchdate: topRatedMovies[index].lunchdate!,
                                    vote: topRatedMovies[index].vote!,
                                  ),
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
                                              'https://image.tmdb.org/t/p/w500${topRatedMovies[index].posterurl}'),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
                                Text(
                                  topRatedMovies[index].name!,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ));
                    }),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
