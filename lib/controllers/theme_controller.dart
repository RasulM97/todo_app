import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constant.dart';

class ThemeController extends GetxController {
  bool isDark = false;
  final theme = GetStorage();

  void toggle() {
    isDark = !isDark;
    if (checkTheme()) {
      Get.changeTheme(darkTheme);
      theme.write('theme', true);
      update();
    } else {
      Get.changeTheme(lightTheme);
      theme.write('theme', false);
      update();
    }
    // update();
  }

  bool checkTheme(){
    theme.read('theme') ?? false;
    return theme.read('theme');
  }
}
