import 'package:get/get.dart';
import '../screens/home_screen.dart';

class SplashController extends GetxController {
  void splash() async {
    await Future.delayed(const Duration(seconds: 3), () {
      return Get.offAll(() => const HomeScreen());
    });
  }
}
