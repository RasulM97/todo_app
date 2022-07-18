import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrangeTheme {
  static ThemeData darkOrange = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.almaraiTextTheme()
        .copyWith(bodyText1: const TextStyle(fontWeight: FontWeight.w700)),
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xff56442A), //secondary container
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff624000), //primary container
      onPrimary: Color(0xffFFDDB1), //on primary container
      secondary: Color(0xff56442A), //secondary container
      onSecondary: Color(0xffFADEBC), //on secondary container
      error: Color(0xff93000A), //error container
      onError: Color(0xffFFDAD6), //on error container
      background: Color(0xff1F1B16), //background
      onBackground: Color(0xffEAE1D9), //on background
      surface: Color(0xff1F1B16), //background
      onSurface: Color(0xffEAE1D9), //on background
    ),
  );

  static ThemeData lightOrange = ThemeData.light().copyWith(
    textTheme: GoogleFonts.almaraiTextTheme()
        .copyWith(bodyText1: const TextStyle(fontWeight: FontWeight.w700)),
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xffFADEBC), //secondary container
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffFFBA4A), //primary container
      onPrimary: Color(0xff442B00), //on primary container
      secondary: Color(0xffFADEBC), //secondary container
      onSecondary: Color(0xff271904), //on secondary container
      error: Color(0xffFFDAD6), //error container
      onError: Color(0xff410002), //on error container
      background: Color(0xffFFFBFF), //background
      onBackground: Color(0xff1F1B16), //on background
      surface: Color(0xffFFFBFF), //background
      onSurface: Color(0xff1F1B16), //on background
    ),
  );
}
