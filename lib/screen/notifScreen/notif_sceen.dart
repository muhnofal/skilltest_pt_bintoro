import 'package:flutter/material.dart';

class NotifScreen extends StatefulWidget {
  final String payload;
  const NotifScreen({super.key, required this.payload});

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Task Reminder"),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   widget.payload,
            //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // ),
            Icon(
              Icons.check_circle,
              color: Colors.grey[600],
              size: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Your Task is finished")
          ],
        ),
      )),
    );
  }
}
