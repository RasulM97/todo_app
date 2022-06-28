import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController{
  TextEditingController? taskTitle;
  TextEditingController? taskNote;

  @override
  void onInit() {
    taskTitle = TextEditingController();
    taskNote = TextEditingController();
    super.onInit();
  }
}