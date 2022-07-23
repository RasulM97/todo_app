import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/controllers/text_field_controller.dart';
import 'package:todo/controllers/theme_controller.dart';
import 'package:todo/models/colors_palette.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        leading: Hero(
          tag: 'about',
          child: ClipSmoothRect(
            radius: SmoothBorderRadius(
              cornerRadius: 20,
              cornerSmoothing: .5,
            ),
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.circleInfo),
                onPressed: () => Get.toNamed('/info'),
              ),
            ),
          ),
        ),
        actions: [
          GetBuilder<ThemeModeController>(
            builder: (value) => PaintTheme(
              items: ColorPalette.myColor,
              value: value,
            ),
          ),
          GetBuilder<ThemeModeController>(
            builder: (value) => SizedBox(
              width: 55,
              child: ClipSmoothRect(
                radius: SmoothBorderRadius(
                  cornerRadius: 20,
                  cornerSmoothing: .5,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      value.toggle();
                    },
                    icon: FaIcon(value.checkThemeMode()
                        ? FontAwesomeIcons.solidSun
                        : FontAwesomeIcons.solidMoon),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      floatingActionButton: FloatingActionButton(
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 20,
            cornerSmoothing: 1,
          ),
        ),
        heroTag: 'add',
        onPressed: () {
          Get.closeAllSnackbars();
          Get.find<TextFieldController>().taskTitle!.text = '';
          Get.find<TextFieldController>().taskNote!.text = '';
          Get.toNamed('/addscreen');
        },
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      body: SafeArea(
          child: Column(
        children: const [
          Expanded(
            flex: 2,
            child: HeaderWidget(),
          ),
          Expanded(
            flex: 7,
            child: TaskItems(),
          ),
        ],
      )),
    );
  }
}

class PaintTheme extends StatelessWidget {
  const PaintTheme({
    Key? key,
    required this.items,
    required this.value,
  }) : super(key: key);

  final List<ColorPalette> items;
  final value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      child: ClipSmoothRect(
        radius: SmoothBorderRadius(
          cornerRadius: 20,
          cornerSmoothing: .5,
        ),
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () {
              Get.bottomSheet(
                  enterBottomSheetDuration: const Duration(milliseconds: 150),
                  exitBottomSheetDuration: const Duration(milliseconds: 150),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          height: 2,
                          indent: 30,
                          endIndent: 30,
                        ),
                        itemCount: items.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 1.0),
                            child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      SmoothRectangleBorder>(
                                    SmoothRectangleBorder(
                                      borderRadius: SmoothBorderRadius(
                                        cornerRadius: 12,
                                        cornerSmoothing: 1,
                                      ),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      Theme.of(context).colorScheme.surface),
                                  foregroundColor: MaterialStateProperty.all<
                                          Color>(
                                      Theme.of(context).colorScheme.onSurface)),
                              child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: ShapeDecoration(
                                            color: Get.isDarkMode
                                                ? items[index].colorLight
                                                : items[index].colorDark,
                                            shape: SmoothRectangleBorder(
                                              borderRadius: SmoothBorderRadius(
                                                cornerRadius: 8,
                                                cornerSmoothing: 0.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(items[index].name.toString()),
                                      ],
                                    ),
                                  )),
                              onPressed: () {
                                value.colorSelected(
                                    items[index].name.toString());
                                Get.back();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ));
            },
            icon: const FaIcon(FontAwesomeIcons.paintbrush),
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: context.isLandscape ? 1 : 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appIcon(context),
                      const SizedBox(
                        height: 10,
                      ),
                      countTasks(context),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: context.isLandscape ? 9 : 7,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 10.0,
                      top: Get.width < 360 ? 5.0 : 0.0,
                      left: context.isLandscape || Get.width < 360 ? 7.0 : 0.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        context.isLandscape
                            ? 'Do Bests, Today Is Yours.'
                            : 'Do Bests,\nToday Is Yours.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            // fontSize: 30,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget appIcon(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 11.0),
        child: Container(
          height: 90,
          width: 90,
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 20,
                cornerSmoothing: 1,
              ),
            ),
          ),
          child: Center(
            child: Hero(
              tag: 'AppIcon',
              child: FaIcon(
                FontAwesomeIcons.clipboardList,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 45,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget countTasks(BuildContext context) {
    return Obx(
      () => FittedBox(
        child: Text(
          '${Get.find<TaskController>().tasks.length} Tasks',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}

class TaskItems extends StatelessWidget {
  const TaskItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var task = Get.find<TaskController>().tasks;
    return ClipSmoothRect(
      radius: const SmoothBorderRadius.only(
        topLeft: SmoothRadius(
          cornerSmoothing: .5,
          cornerRadius: 30,
        ),
        topRight: SmoothRadius(
          cornerSmoothing: .5,
          cornerRadius: 30,
        ),
      ),
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Scrollbar(
          radius: const Radius.circular(50),
          trackVisibility: true,
          child: Obx(
            () => task.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.only(bottom: 80, top: 10.0),
                    itemBuilder: (context, index) {
                      var remove = task[index];
                      return WidgetHandle(
                              context: context,
                              task: task,
                              index: index,
                              remove: remove)
                          .swipeToDismiss();
                    },
                    separatorBuilder: (context, index) => const Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                    itemCount: task.length,
                  )
                : empty(context),
          ),
        ),
      ),
    );
  }
}

Widget empty(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(
        width: double.infinity,
      ),
      SizedBox(
        height: 55,
        width: 55,
        child: DecoratedBox(
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(.1),
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 15,
                cornerSmoothing: 1,
              ),
            ),
          ),
          child: Center(
              child: FaIcon(FontAwesomeIcons.faceSmile,
                  color: Theme.of(context).colorScheme.onPrimary)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Nothing to show',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      Text(
        'Add new task with + button',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
    ],
  );
}

class WidgetHandle {
  BuildContext context;
  List task;
  int index;
  var remove;

  WidgetHandle(
      {required this.context,
      required this.task,
      required this.index,
      this.remove});

  Widget swipeToDismiss() {
    return ClipSmoothRect(
      radius: SmoothBorderRadius(
        cornerRadius: 10,
        cornerSmoothing: 1,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Dismissible(
          direction: DismissDirection.startToEnd,
          background: Container(
            decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.error,
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 12,
                  cornerSmoothing: 0.5,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(Icons.delete,
                      color: Theme.of(context).colorScheme.onError),
                  Text('Delete',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onError)),
                ],
              ),
            ),
          ),
          onDismissed: (value) {
            if (Get.isSnackbarOpen) {
              Get.closeAllSnackbars();
              task.removeAt(index);
              task.insert(index, remove);
            }
            showMessageDialog();
          },
          key: UniqueKey(),
          child: ClipSmoothRect(
            radius: SmoothBorderRadius(
              cornerRadius: 10,
              cornerSmoothing: 1,
            ),
            child: Container(
              decoration: ShapeDecoration(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.06),
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 12,
                    cornerSmoothing: 0.5,
                  ),
                ),
              ),
              child: ListTile(
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 12,
                    cornerSmoothing: 0.5,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    task[index].title ?? '',
                    style: TextStyle(
                      decoration: task[index].done!
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationThickness: 2.5,
                      decorationColor: Theme.of(context).colorScheme.onPrimary,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                subtitle: Text(
                  task[index].note ?? '',
                  style: TextStyle(
                    decoration: task[index].done!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 2.5,
                    decorationColor: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5),
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.7),
                  ),
                ),
                trailing: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ClipSmoothRect(
                      radius: SmoothBorderRadius(
                        cornerRadius: 10,
                        cornerSmoothing: .5,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () => editTask(),
                          icon: FaIcon(
                            FontAwesomeIcons.penToSquare,
                            size: 20,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                    Checkbox(
                      splashRadius: 18,
                      checkColor: Theme.of(context).colorScheme.primary,
                      activeColor: Theme.of(context).colorScheme.onPrimary,
                      value: task[index].done,
                      onChanged: (value) {
                        task[index].done = !task[index].done!;
                        Get.find<TaskController>().tasks[index] = task[index];
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showMessageDialog() {
    Get.defaultDialog(
      title: 'Delete Task',
      titleStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      middleText: 'Are you sure to delete this task?',
      middleTextStyle:
          TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      barrierDismissible: false,
      radius: 10,
      backgroundColor: Theme.of(context).colorScheme.background,
      confirm: TextButton(
        child: Text(
          'Yes',
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.closeAllSnackbars();
          }
          task.removeAt(index);
          Get.back();
          snackBar();
        },
      ),
      cancel: TextButton(
        child: Text(
          'No',
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        onPressed: () => cancelButton(),
      ),
    );
  }

  void snackBar() {
    Get.snackbar(
      remove.title!,
      'This task was deleted.',
      mainButton: undoButton(),
      icon: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 5.0),
        child: FaIcon(
          FontAwesomeIcons.trash,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(15),
      dismissDirection: DismissDirection.horizontal,
      borderWidth: .2,
      borderColor: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  TextButton undoButton() {
    return TextButton(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.rotateLeft,
            size: 16,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            'Undo',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
      onPressed: () {
        task.insert(index, remove);
        Get.back();
      },
    );
  }

  void editTask() {
    Get.find<TaskController>().isEditing = true;
    Get.find<TextFieldController>().taskTitle!.text = task[index].title!;
    Get.find<TextFieldController>().taskNote!.text = task[index].note!;
    Get.find<TaskController>().index = index;
    Get.toNamed('/addscreen');
  }

  void cancelButton() {
    task.removeAt(index);
    task.insert(index, remove);
    Get.back();
  }
}
