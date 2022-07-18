import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PinkTheme {
  static ThemeData darkPink = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.almaraiTextTheme()
        .copyWith(bodyText1: const TextStyle(fontWeight: FontWeight.w700)),
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xff59404B), //secondary container
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff782956), //primary container
      onPrimary: Color(0xffFFD8E8), //on primary container
      secondary: Color(0xff59404B), //secondary container
      onSecondary: Color(0xffFDD9E7), //on secondary container
      error: Color(0xff93000A), //error container
      onError: Color(0xffFFDAD6), //on error container
      background: Color(0xff1E1B1C), //background
      onBackground: Color(0xffEBE0E2), //on background
      surface: Color(0xff1E1B1C), //background
      onSurface: Color(0xffEBE0E2), //on background
    ),
  );

  static ThemeData lightPink = ThemeData.light().copyWith(
    textTheme: GoogleFonts.almaraiTextTheme()
        .copyWith(bodyText1: const TextStyle(fontWeight: FontWeight.w700)),
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xffFDD9E7), //secondary container
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffFFD8E8), //primary container
      onPrimary: Color(0xff3D0027), //on primary container
      secondary: Color(0xffFDD9E7), //secondary container
      onSecondary: Color(0xff402A34), //on secondary container
      error: Color(0xffFFDAD6), //error container
      onError: Color(0xff410002), //on error container
      background: Color(0xffFFFBFF), //background
      onBackground: Color(0xff1E1B1C), //on background
      surface: Color(0xffFFFBFF), //background
      onSurface: Color(0xff1E1B1C), //on background
    ),
  );
}
