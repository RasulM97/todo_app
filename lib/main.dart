import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/bindings/bindings.dart';
import 'package:todo/controllers/theme_controller.dart';
import 'package:todo/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  Get.put(ThemeModeController());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final theme = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeModeController>(
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'iDo',
          initialBinding: AppBindings(),
          getPages: Routes.pages,
          initialRoute: '/splash',
          theme: controller.loadLight(controller.light()),
          darkTheme: controller.loadDark(controller.dark()),
          themeMode: controller.checkThemeMode()
              ? ThemeMode.dark
              : ThemeMode.light,
          defaultTransition: Transition.cupertino,
        );
      }
    );
  }
}
