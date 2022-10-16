class PopularTvShow {
   final String? name;
  final String? description;
  final String? bannerurl;
  final String? posterurl;
  final String? vote;
  final String? lunchdate;
  final String? originaltitle;
  PopularTvShow({
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.lunchdate,
    required this.originaltitle,
  });


  factory PopularTvShow.fromJson(Map<String, dynamic> json) {
    return PopularTvShow(
      name: json['name'] ?? json['title'],
      description: json['overview'],
      bannerurl: json['backdrop_path'],
      posterurl: json['poster_path'],
      vote: json['vote_average'].toString(),
      lunchdate: json['first_air_date'],
      originaltitle: json['original_name'],
    );
  }
}