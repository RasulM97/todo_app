import 'package:get/get.dart';
import 'package:todo/controllers/splash_controller.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/controllers/text_field_controller.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
    Get.put(TextFieldController());
    Get.putAsync(() async => SplashController().splash());
  }
}