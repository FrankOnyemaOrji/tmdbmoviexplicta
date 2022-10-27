import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdbmovieapp/cubit/toprated/toprated_cubit.dart';
import 'package:tmdbmovieapp/view/exports.dart';

import 'cubit/trendingmovies/trendingmovies_cubit.dart';
import 'cubit/tvshows/tvshows_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TrendingmoviesCubit(),
        ),
        BlocProvider(
          create: (context) => TopratedCubit(),
        ),
        BlocProvider(
          create: (_) => TvshowsCubit(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie App',
            theme: ThemeData(
              primaryColor: const Color(0xff071a52),
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
