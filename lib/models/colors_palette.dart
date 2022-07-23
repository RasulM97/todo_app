import 'dart:core';
import 'package:flutter/material.dart';

class ColorPalette {
  String? name;
  Color? colorLight;
  Color? colorDark;

  ColorPalette({this.name, this.colorLight, this.colorDark});

  static List<ColorPalette> myColor = [
    ColorPalette(
      name: 'Blue',
      colorLight: const Color(0xff76D1FF),
      colorDark: const Color(0xff004D67),
    ),
    ColorPalette(
      name: 'Green',
      colorLight: const Color(0xffC5F173),
      colorDark: const Color(0xff364E00),
    ),
    ColorPalette(
      name: 'Purple',
      colorLight: const Color(0xffE2DFFF),
      colorDark: const Color(0xff3F3C8F),
    ),
    ColorPalette(
      name: 'Orange',
      colorLight: const Color(0xffFFBA4A),
      colorDark: const Color(0xff624000),
    ),
    ColorPalette(
      name: 'Pink',
      colorLight: const Color(0xffFFD8E8),
      colorDark: const Color(0xff782956),
    ),
  ];
}
