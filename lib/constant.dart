import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: GoogleFonts.readexProTextTheme(),
  useMaterial3: true,
  textSelectionTheme: const TextSelectionThemeData(selectionColor: Color(0xff424A32)),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff364E00),
    onPrimary: Color(0xffC5F173),
    secondary: Color(0xff424A32),
    onSecondary: Color(0xffDDE6C6),
    error: Color(0xff93000A),
    onError: Color(0xffFFDAD6),
    background: Color(0xff1B1C17),
    onBackground: Color(0xffE4E3DB),
    surface: Color(0xff1B1C17),
    onSurface: Color(0xffE4E3DB),
  ),
);

ThemeData lightTheme = ThemeData.light().copyWith(
  textTheme: GoogleFonts.readexProTextTheme(),
  useMaterial3: true,
  textSelectionTheme: const TextSelectionThemeData(selectionColor: Color(0xffDDE6C6)),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffC5F173),
    onPrimary: Color(0xff131F00),
    secondary: Color(0xffDDE6C6),
    onSecondary: Color(0xff171E0A),
    error: Color(0xffFFDAD6),
    onError: Color(0xff410002),
    background: Color(0xffF9FFE6),
    onBackground: Color(0xff1B1C17),
    surface: Color(0xffF9FFE6),
    onSurface: Color(0xff1B1C17),
  ),
);
