import 'package:get/get.dart';
import 'package:todo/screens/add_task_screen.dart';
import 'package:todo/screens/home_screen.dart';
import 'package:todo/screens/info_screen.dart';
import 'package:todo/screens/splash_screen.dart';

class Routes{
  static List<GetPage> get pages => [
    GetPage(name: '/homescreen', page: ()=> const HomeScreen()),
    GetPage(name: '/addscreen', page: ()=> const AddTaskScreen()),
    GetPage(name: '/splash', page: ()=> const SplashScreen()),
    GetPage(name: '/info', page: ()=> const InfoScreen()),
  ];
}