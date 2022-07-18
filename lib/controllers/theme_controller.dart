import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/theme_data/orange_theme.dart';
import '../theme_data/green_theme.dart';
import '../theme_data/blue_theme.dart';
import '../theme_data/pink_theme.dart';
import '../theme_data/purple_theme.dart';

class ThemeModeController extends GetxController {
  final theme = GetStorage();

  bool checkThemeMode() {
    return theme.read('themeModeDark') ?? false;
  }

  void toggle() {
    final isDark = checkThemeMode();
    final cLight = light();
    final cDark = dark();
    Get.changeTheme(isDark ? loadLight(cLight) : loadDark(cDark));
    Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
    theme.write('themeModeDark', !isDark);
    update();
  }

  void tapOnColor(){
    final isDark = checkThemeMode();
    final cLight = light();
    final cDark = dark();
    Get.changeTheme(isDark ? loadDark(cDark) : loadLight(cLight));
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    update();
  }

  colorSelected(String color) {
    switch (color) {
      case 'Blue':
        theme.write('themeLight', 'lightBlue');
        theme.write('themeDark', 'darkBlue');
        tapOnColor();
        break;
      case 'Green':
        theme.write('themeLight', 'lightGreen');
        theme.write('themeDark', 'darkGreen');
        tapOnColor();
        break;
      case 'Purple':
        theme.write('themeLight', 'lightPurple');
        theme.write('themeDark', 'darkPurple');
        tapOnColor();
        break;
      case 'Orange':
        theme.write('themeLight', 'lightOrange');
        theme.write('themeDark', 'darkOrange');
        tapOnColor();
        break;
      case 'Pink':
        theme.write('themeLight', 'lightPink');
        theme.write('themeDark', 'darkPink');
        tapOnColor();
        break;
    }
  }

  String light() {
    return theme.read('themeLight') ?? 'lightBlue';
  }

  String dark() {
    return theme.read('themeDark') ?? 'darkBlue';
  }

  ThemeData loadLight (String chosenColor){
    switch(chosenColor){
      case "lightBlue":
        return BlueTheme.lightBlue;
      case "lightGreen":
        return GreenTheme.lightGreen;
      case "lightPurple":
        return PurpleTheme.lightPurple;
      case "lightOrange":
        return OrangeTheme.lightOrange;
      case "lightPink":
        return PinkTheme.lightPink;
      default:
        throw Error();
    }
  }

  ThemeData loadDark (String chosenColor){
    switch(chosenColor){
      case "darkBlue":
        return BlueTheme.darkBlue;
      case "darkGreen":
        return GreenTheme.darkGreen;
      case "darkPurple":
        return PurpleTheme.darkPurple;
      case "darkOrange":
        return OrangeTheme.darkOrange;
      case "darkPink":
        return PinkTheme.darkPink;
      default:
        throw Error();
    }
  }
}
