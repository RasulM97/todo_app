import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlueTheme {
  static ThemeData darkBlue = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.almaraiTextTheme()
        .copyWith(bodyText1: const TextStyle(fontWeight: FontWeight.w700)),
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xff364954), //secondary container
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff004D67), //primary container
      onPrimary: Color(0xffC2E8FF), //on primary container
      secondary: Color(0xff364954), //secondary container
      onSecondary: Color(0xffD1E5F3), //on secondary container
      error: Color(0xff93000A), //error container
      onError: Color(0xffFFDAD6), //on error container
      background: Color(0xff1A1C1D), //background
      onBackground: Color(0xffE1E2E5), //on background
      surface: Color(0xff1A1C1D), //background
      onSurface: Color(0xffE1E2E5), //on background
    ),
  );

  static ThemeData lightBlue = ThemeData.light().copyWith(
    textTheme: GoogleFonts.almaraiTextTheme()
        .copyWith(bodyText1: const TextStyle(fontWeight: FontWeight.w700)),
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xffD1E5F3), //secondary container
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff76D1FF), //primary container
      onPrimary: Color(0xff003548), //on primary container
      secondary: Color(0xffD1E5F3), //secondary container
      onSecondary: Color(0xff091E28), //on secondary container
      error: Color(0xffFFDAD6), //error container
      onError: Color(0xff410002), //on error container
      background: Color(0xffFBFCFF), //background
      onBackground: Color(0xff1A1C1D), //on background
      surface: Color(0xffFBFCFF), //background
      onSurface: Color(0xff1A1C1D), //on background
    ),
  );
}
