import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skilltest_pt_bintoro/controller/task_controller.dart';
import 'package:skilltest_pt_bintoro/service/notification_service.dart';
import 'package:skilltest_pt_bintoro/screen/homeScreen/card/list_card.dart';
import 'package:skilltest_pt_bintoro/screen/newTaskScreen/new_task_screen.dart';
import 'package:skilltest_pt_bintoro/screen/notifScreen/notif_sceen.dart';
import 'package:skilltest_pt_bintoro/screen/taskDetail/task_detail.dart';
import 'package:timezone/data/latest.dart' as tz;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController _taskController = Get.put(TaskController());

  @override
  void initState() {
    tz.initializeTimeZones();
    NotificationService().initNotification();
    listenNotification();
    super.initState();
  }

  void listenNotification() =>
      NotificationService.onNotifications.stream.listen(onClickNotification);

  void onClickNotification(String? payload) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NotifScreen(
                payload: payload!,
              )));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => _taskController.taskData.isEmpty
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.self_improvement_sharp,
                      color: Colors.grey[700],
                      size: 150,
                    ),
                    Text(
                      "There's no task here...",
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ))
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _taskController.taskData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TaskDetail(
                                  id: _taskController.taskData[index].id!,
                                  title: _taskController.taskData[index].title!,
                                  date: _taskController.taskData[index].date!,
                                  time: _taskController.taskData[index].time!,
                                )));
                      },
                      child: ListCard(
                        id: _taskController.taskData[index].id!,
                        title: _taskController.taskData[index].title!,
                        date: _taskController.taskData[index].date!,
                        time: _taskController.taskData[index].time!,
                      ),
                    );
                  },
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NewTaskScreen()));
        },
        tooltip: 'New Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
