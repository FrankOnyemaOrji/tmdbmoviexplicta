part of 'trendingmovies_cubit.dart';

abstract class TrendingmoviesState extends Equatable {
  const TrendingmoviesState();

  @override
  List<Object> get props => [];
  get trendingMovies => <TrendingMovies>[];
}

class TrendingmoviesInitial extends TrendingmoviesState {
  const TrendingmoviesInitial();
}

class GetTrendingMovies extends TrendingmoviesState {
  @override
  final List<TrendingMovies> trendingMovies;
  const GetTrendingMovies({required this.trendingMovies});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetTrendingMovies && other.trendingMovies == trendingMovies;
  }

  @override
  int get hashCode => trendingMovies.hashCode;
}
class LoadingTrendingMovie extends TrendingmoviesState {
  const LoadingTrendingMovie();
}

