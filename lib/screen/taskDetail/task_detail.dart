import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skilltest_pt_bintoro/controller/task_controller.dart';
import 'package:skilltest_pt_bintoro/utils/colors.dart';

class TaskDetail extends StatefulWidget {
  final int id;
  final String title;
  final String date;
  final String time;
  const TaskDetail({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.id,
  });

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  final TaskController _taskController = Get.put(TaskController());
  TextEditingController? taskController;
  TextEditingController? dateController;
  TextEditingController? timeController;

  @override
  Widget build(BuildContext context) {
    taskController = TextEditingController(text: widget.title);
    dateController = TextEditingController(text: widget.date);
    timeController = TextEditingController(text: widget.time);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Task Detail"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The Task",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: secondaryBlack,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 10.0,
                            offset: Offset(5, 1),
                            spreadRadius: 0,
                            color: Colors.black38),
                      ],
                    ),
                    child: TextFormField(
                      controller: taskController,
                      autofocus: false,
                      readOnly: true,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        enabled: true,
                        hintText: "Enter task here",
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Due Date",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: secondaryBlack,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 10.0,
                            offset: Offset(5, 1),
                            spreadRadius: 0,
                            color: Colors.black38),
                      ],
                    ),
                    child: TextFormField(
                      controller: dateController,
                      readOnly: true,
                      autofocus: false,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        enabled: true,
                        hintText: "Due not set",
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              dateController!.text == ""
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: secondaryBlack,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 10.0,
                              offset: Offset(5, 1),
                              spreadRadius: 0,
                              color: Colors.black38),
                        ],
                      ),
                      child: TextFormField(
                        controller: timeController,
                        readOnly: true,
                        autofocus: false,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.white),
                          focusColor: Colors.white,
                          enabled: true,
                          hintText: "Time not set",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    child: const Text("Finish Task"),
                    onPressed: () {
                      _taskController.deleteTask(widget.id);
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
