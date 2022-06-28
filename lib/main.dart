import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/bindings/bindings.dart';
import 'package:todo/constant.dart';
import 'package:todo/routes/routes.dart';

void main() async {
  await GetStorage.init();
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iDo',
      initialBinding: AppBindings(),
      getPages: Routes.pages,
      initialRoute: '/splash',
      theme: lightTheme,
      //todo: improve theme change
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
          // theme.read('theme') ?? false ? ThemeMode.dark : ThemeMode.light, // todo: fix this later
      defaultTransition: Transition.cupertino,
    );
  }
}
