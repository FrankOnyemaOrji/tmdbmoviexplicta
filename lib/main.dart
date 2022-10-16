import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdbmovieapp/view/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          theme: ThemeData(
            primaryColor: const Color(0xff071a52),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
