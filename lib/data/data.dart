import 'package:http/http.dart' as http;
import 'dart:convert';

import '../view/exports.dart';

const String apikey = '3d8167986635e347263c13dc4a498839';

class TrendingData {
  Future<List<TrendingMovies>> getTrendingData() async {
    List<TrendingMovies> trendingData = [];
    String url =
        "https://api.themoviedb.org/3/trending/all/day?api_key=$apikey";
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);

      decodedResponse["results"].forEach((element) {
        trendingData.add(TrendingMovies.fromJson(element));
      });
      return trendingData;
    } else {
      throw Exception(
          'Failed to load data: ${response.statusCode} ${response.body}');
    }
  }
}

class TvShowData {
  Future<List<PopularTvShow>> geTvShowData() async {
    List<PopularTvShow> tvShowData = [];
    String url =
        "https://api.themoviedb.org/3/tv/popular?api_key=$apikey&language=en-US&page=1";
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);

      decodedResponse["results"].forEach((element) {
        tvShowData.add(PopularTvShow.fromJson(element));
      });
      return tvShowData;
    } else {
      throw Exception(
          'Failed to load data: ${response.statusCode} ${response.body}');
    }
  }
}

class TopratedData {
  Future<List<TopRatedMovie>> getTopRatedData() async {
    List<TopRatedMovie> showTopRatedData = [];
    String url =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US&page=1";
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);

      decodedResponse["results"].forEach((element) {
        showTopRatedData.add(TopRatedMovie.fromJson(element));
      });
      return showTopRatedData;
    } else {
      throw Exception(
          'Failed to load data: ${response.statusCode} ${response.body}');
    }
  }
}
