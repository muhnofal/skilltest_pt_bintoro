import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skilltest_pt_bintoro/db/db_helper.dart';
import 'package:skilltest_pt_bintoro/models/task.dart';

class TaskController extends GetxController {
  var taskData = <Task>[].obs;
  TextEditingController? titleController;
  TextEditingController? dateController;
  TextEditingController? timeController;

  @override
  void onInit() {
    titleController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();
    _getData();
    super.onInit();
  }

  void _getData() {
    DBHelper.instance.queryAllRows().then((value) {
      for (var element in value) {
        taskData.add(
          Task(
            id: element['id'],
            title: element['title'],
            date: element['date'],
            time: element['time'],
          ),
        );
      }
    });
  }

  void addData() async {
    await DBHelper.instance.insert(Task(
        title: titleController!.text,
        date: dateController!.text,
        time: timeController!.text));
    taskData.insert(
        0,
        Task(
            id: taskData.length,
            title: titleController!.text,
            date: dateController!.text,
            time: timeController!.text));
    titleController!.clear();
    dateController!.clear();
    timeController!.clear();
  }

  void deleteTask(int id) async {
    await DBHelper.instance.delete(id);

    taskData.removeWhere((element) => element.id == id);
  }
}
