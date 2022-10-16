class TrendingMovies {
  final String? name;
  final String? description;
  final String? bannerurl;
  final String? posterurl;
  final String? vote;
  final String? lunchdate;
  final String? originaltitle;
  TrendingMovies({
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.lunchdate,
    required this.originaltitle,
  });

  factory TrendingMovies.fromJson(Map<String, dynamic> json) {
    return TrendingMovies(
      name: json['title'] ?? json['name'],
      description: json['overview'],
      bannerurl: json['backdrop_path'],
      posterurl: json['poster_path'],
      vote: json['vote_average'].toString(),
      lunchdate: json['release_date'],
      originaltitle: json['original_title'],
    );
  }
}
