part of 'tvshows_cubit.dart';

abstract class TvshowsState extends Equatable {
  const TvshowsState();

  @override
  List<Object> get props => [];
  get tvShows => <PopularTvShow>[];
}

class TvshowsInitial extends TvshowsState {
  const TvshowsInitial();
}
class GetTvShows extends TvshowsState {
  @override
  final List<PopularTvShow> tvShows;
  const GetTvShows({required this.tvShows});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetTvShows && other.tvShows == tvShows;
  }

  @override
  int get hashCode => tvShows.hashCode;
}
class LoadingTvShows extends TvshowsState {
  const LoadingTvShows();
}
