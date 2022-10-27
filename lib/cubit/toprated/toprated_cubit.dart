import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../view/exports.dart';

part 'toprated_state.dart';

class TopratedCubit extends Cubit<TopratedState> {
  TopratedCubit() : super(const TopratedInitial());

  void topRate(topRatedMovies) {
    emit(const LoadingMovie());
    emit(GetTopRatedMovies(topRatedMovies: topRatedMovies));
  }
}
