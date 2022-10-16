// ignore_for_file: sized_box_for_whitespace, unnecessary_null_comparison, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Descrisption extends StatelessWidget {
  final String name;
  final String description;
  final String bannerurl;
  final String posterurl;
  final String vote;
  final String lunchdate;

  const Descrisption({
    super.key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.lunchdate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff071a52),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xff071a52),
      body: Container(
        padding: const EdgeInsets.all(3),
        child: ListView(
          children: [
            Container(
              height: 100.w,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 150.w,
                      width: double.infinity,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    bottom: 15,
                    child: Text('⭐ Average_Rating $vote',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                name != null ? name : "Not loding name",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text("Releasing On $lunchdate",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50.w,
                  width: 50.w,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Text(
                    description,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
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
