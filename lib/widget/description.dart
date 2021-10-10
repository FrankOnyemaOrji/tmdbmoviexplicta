// ignore_for_file: non_constant_identifier_names, prefer_if_null_operators, unnecessary_null_comparison, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:moviexplicta/utils/text.dart';

class Description extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String name, description, bannerurl, posterurl, vote, launch_on;
  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          bannerurl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        left: 15,
                        bottom: 15,
                        child: modified_Text(
                          color: Colors.white,
                          text: '⭐ Average_Rating ' + vote,
                          size: 15,
                        ))
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: modified_Text(
                  color: Colors.white,
                  size: 24,
                  text: name != null ? name : 'not loading'),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: modified_Text(
                  color: Colors.white,
                  size: 14,
                  text: 'Releasing On -' + launch_on),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: modified_Text(
                        color: Colors.white, size: 18, text: description),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
