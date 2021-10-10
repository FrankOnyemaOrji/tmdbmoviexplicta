// ignore_for_file: unused_element, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:moviexplicta/utils/text.dart';
import 'package:moviexplicta/widget/description.dart';

class PopularTvShows extends StatelessWidget {
  final List Tv;
  const PopularTvShows({Key? key, required this.Tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_Text(
              color: Colors.white, size: 26, text: 'Popular Tv Shows'),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Tv.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: Tv[index]['original_name'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      Tv[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      Tv[index]['poster_path'],
                                  description: Tv[index]['overview'],
                                  vote: Tv[index]['vote_average'].toString(),
                                  launch_on:
                                      Tv[index]['release_date'].toString())));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          Tv[index]['backdrop_path']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            child: modified_Text(
                                color: Colors.white,
                                size: 10,
                                text: Tv[index]['original_name'] ?? 'loading'),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
