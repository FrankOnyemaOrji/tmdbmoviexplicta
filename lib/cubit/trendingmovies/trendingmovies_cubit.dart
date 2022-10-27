import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../view/exports.dart';

part 'trendingmovies_state.dart';

class TrendingmoviesCubit extends Cubit<TrendingmoviesState> {
  TrendingmoviesCubit() : super(const TrendingmoviesInitial());
  void trendingMovies(trendingMovies) {
    emit(const LoadingTrendingMovie());
    emit(GetTrendingMovies(trendingMovies: trendingMovies));
  }
}
