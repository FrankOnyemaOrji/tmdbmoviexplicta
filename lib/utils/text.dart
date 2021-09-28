// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modified_Text extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const modified_Text(
      {Key? key, required this.color, required this.size, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.breeSerif(color: color, fontSize: size));
  }
}
