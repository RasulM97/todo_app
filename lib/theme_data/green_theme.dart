import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreenTheme {
  static ThemeData darkGreen = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.almaraiTextTheme()
        .copyWith(bodyText1: const TextStyle(fontWeight: FontWeight.w700)),
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xff424A32), //secondary container
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff364E00), //primary container
      onPrimary: Color(0xffC5F173), //on primary container
      secondary: Color(0xff424A32), //secondary container
      onSecondary: Color(0xffDDE6C6), //on secondary container
      error: Color(0xff93000A), //error container
      onError: Color(0xffFFDAD6), //on error container
      background: Color(0xff1B1C17), //background
      onBackground: Color(0xffE4E3DB), //on background
      surface: Color(0xff1B1C17), //background
      onSurface: Color(0xffE4E3DB), //on background
    ),
  );

  static ThemeData lightGreen = ThemeData.light().copyWith(
    textTheme: GoogleFonts.almaraiTextTheme()
        .copyWith(bodyText1: const TextStyle(fontWeight: FontWeight.w700)),
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Color(0xffDDE6C6), //secondary container
        ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffC5F173), //primary container
      onPrimary: Color(0xff131F00), //on primary container
      secondary: Color(0xffDDE6C6), //secondary container
      onSecondary: Color(0xff171E0A), //on secondary container
      error: Color(0xffFFDAD6), //error container
      onError: Color(0xff410002), //on error container
      background: Color(0xffF9FFE6), //background
      onBackground: Color(0xff1B1C17), //on background
      surface: Color(0xffF9FFE6), //background
      onSurface: Color(0xff1B1C17), //on background
    ),
  );
}
