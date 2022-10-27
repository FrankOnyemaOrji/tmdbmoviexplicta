part of 'toprated_cubit.dart';

abstract class TopratedState extends Equatable {
  const TopratedState();

  @override
  List<Object> get props => [];
  get topRatedMovies => <TopRatedMovie>[];
}

class TopratedInitial extends TopratedState {
  const TopratedInitial();
}

class GetTopRatedMovies extends TopratedState {
  @override
  final List<TopRatedMovie> topRatedMovies;
  const GetTopRatedMovies({required this.topRatedMovies});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetTopRatedMovies && other.topRatedMovies == topRatedMovies;
  }

  @override
  int get hashCode => topRatedMovies.hashCode;
}
class LoadingMovie extends TopratedState {
  const LoadingMovie();
}

