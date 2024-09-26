import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(0xff5A7C76);
Color secondaryColor = Colors.white;

myStyle(double fs, [Color? clr, FontWeight? fw]) {
  return GoogleFonts.nunito(
    fontSize: fs,
    color: clr,
    fontWeight: fw,
  );
}