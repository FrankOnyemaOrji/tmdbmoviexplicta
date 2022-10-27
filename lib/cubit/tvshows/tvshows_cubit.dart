import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../view/exports.dart';

part 'tvshows_state.dart';

class TvshowsCubit extends Cubit<TvshowsState> {
  TvshowsCubit() : super(const TvshowsInitial());

  void tvShows(tvShows) {
    emit(const LoadingTvShows());
    emit(GetTvShows(tvShows: tvShows));
  }
}
