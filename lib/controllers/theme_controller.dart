import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constant.dart';

class ThemeController extends GetxController {
  final theme = GetStorage();

  void toggle() {
    final isDark = checkTheme();
    Get.changeTheme(isDark ? lightTheme : darkTheme);
    theme.write('theme', !isDark);
    Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
    update();
  }

  bool checkTheme() {
    return theme.read('theme') ?? false;
  }
}
