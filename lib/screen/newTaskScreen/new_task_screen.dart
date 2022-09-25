import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skilltest_pt_bintoro/controller/task_controller.dart';
import 'package:skilltest_pt_bintoro/service/notification_service.dart';
import 'package:skilltest_pt_bintoro/utils/colors.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("New Task"),
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
                    "What is to be done?",
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
                      controller: _taskController.titleController,
                      autofocus: false,
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
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 1)),
                            lastDate: DateTime(2100));
                        if (newDate == null) return;

                        setState(() {
                          date = newDate;
                          String dateConvert =
                              DateFormat('EEE, MMMM dd, yyyy').format(date);
                          _taskController.dateController!.text = dateConvert;
                        });
                      },
                      controller: _taskController.dateController,
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
              _taskController.dateController!.text == ""
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
                        onTap: () async {
                          TimeOfDay? newTime = await showTimePicker(
                              context: context, initialTime: time);
                          if (newTime == null) return;

                          setState(() {
                            time = newTime;
                            time.hour;
                            // String dateConvert =
                            //   DateFormat('EEE, MMMM dd, yyyy').format(time);
                            _taskController.timeController!.text =
                                time.format(context);
                          });
                        },
                        controller: _taskController.timeController,
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _taskController.addData();
          DateTime newDateTime =
              DateTime(date.year, date.month, date.day, time.hour, time.minute);

          // ignore: avoid_print
          print(
              "tahun: ${newDateTime.year}, bulan: ${newDateTime.month}, hari: ${newDateTime.day}, jam: ${newDateTime.hour}, menit: ${newDateTime.minute}");

          NotificationService().setReminder(
              0,
              _taskController.titleController!.text,
              "see the detail",
              newDateTime,
              _taskController.titleController!.text);
          Navigator.pop(context);
        },
        tooltip: 'New Task',
        child: const Icon(Icons.check),
      ),
    );
  }
}
