import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/controllers/text_field_controller.dart';
import 'package:todo/models/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
            Get.find<TaskController>().isEditing ? 'Edit Task' : 'New Task'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Hero(
            tag: 'about',
            child: SizedBox(
              width: 55,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                      onPressed: () {
                        Get.find<TaskController>().isEditing = false;
                        Get.back();
                      },
                      icon: const FaIcon(FontAwesomeIcons.xmark)),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      'What is your plan today?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                  const TitleInputText(),
                  const NoteInputText(),
                  const AddButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TitleInputText extends StatelessWidget {
  const TitleInputText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        showCursor: true,
        cursorRadius: const Radius.circular(50),
        cursorColor: Theme.of(context).colorScheme.onPrimary,
        cursorWidth: 2.5,
        autofocus: true,
        controller: Get.find<TextFieldController>().taskTitle,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSecondary),
        decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            prefixIcon: Icon(
              FontAwesomeIcons.message,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            labelText: 'Title',
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(.3))),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    width: 2, color: Theme.of(context).colorScheme.onSurface))),
      ),
    );
  }
}

class NoteInputText extends StatelessWidget {
  const NoteInputText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        showCursor: true,
        cursorRadius: const Radius.circular(50),
        cursorColor: Theme.of(context).colorScheme.onPrimary,
        cursorWidth: 2.5,
        minLines: 1,
        maxLines: 10,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSecondary),
        controller: Get.find<TextFieldController>().taskNote,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.onSecondary.withOpacity(.1),
          prefixIcon: Icon(
            FontAwesomeIcons.comment,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          labelText: 'Note',
          labelStyle:
              TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
              ),
        ),
      ),
    );
  }
}

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 42,
      child: Hero(
        tag: 'add',
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.surface),
              foregroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.onSurface)),
          onPressed: () {
            if (Get.find<TextFieldController>().taskTitle!.text == '') {
              emptyFields(context);
              return;
            } else if (Get.find<TaskController>().isEditing) {
              editingTask();
            } else {
              addingTask();
            }
          },
          child: changeButtonMode(),
        ),
      ),
    );
  }

  void emptyFields(BuildContext context) {
    Get.snackbar('', '',
        icon: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 5.0),
          child: FaIcon(
            FontAwesomeIcons.circleExclamation,
            color: Theme.of(context).colorScheme.onError,
          ),
        ),
        titleText: Text(
          'Empty field',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onError,
          ),
        ),
        messageText: Text(
          'Title field can\'t be empty you have to write something.',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onError,
          ),
        ),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(15),
        dismissDirection: DismissDirection.horizontal,
        borderWidth: .2,
        borderColor: Theme.of(context).colorScheme.onError,
        backgroundColor: Theme.of(context).colorScheme.error);
  }

  void editingTask() {
    if(Get.isSnackbarOpen){
      return;
    }else {
      var editTask =
          Get.find<TaskController>().tasks[Get.find<TaskController>().index];

      editTask.title = Get.find<TextFieldController>().taskTitle!.text;
      editTask.note = Get.find<TextFieldController>().taskNote!.text;
      editTask.done = false;
      Get.find<TaskController>().tasks[Get.find<TaskController>().index] =
          editTask;
      Get.find<TaskController>().isEditing = false;
      Get.back();
    }
  }

  void addingTask() {
    if(Get.isSnackbarOpen){
      return;
    }else{
      Get.find<TaskController>().tasks.add(
        TaskModel(
          title: Get.find<TextFieldController>().taskTitle!.text,
          note: Get.find<TextFieldController>().taskNote!.text,
        ),
      );
      Get.find<TextFieldController>().taskTitle!.text = '';
      Get.find<TextFieldController>().taskNote!.text = '';
      Get.back();
    }
  }

  Widget changeButtonMode() {
    return Wrap(
      children: [
        Get.find<TaskController>().isEditing
            ? const FaIcon(
                FontAwesomeIcons.penToSquare,
                size: 18,
              )
            : const FaIcon(
                FontAwesomeIcons.plus,
                size: 18,
              ),
        const SizedBox(
          width: 5,
        ),
        Text(Get.find<TaskController>().isEditing ? 'Edit task' : 'Add task'),
      ],
    );
  }
}
