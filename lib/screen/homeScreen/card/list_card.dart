import 'package:flutter/material.dart';
import 'package:skilltest_pt_bintoro/utils/colors.dart';

class ListCard extends StatefulWidget {
  final int id;
  final String title;
  final String date;
  final String time;
  const ListCard(
      {super.key,
      required this.title,
      required this.date,
      required this.time,
      required this.id});

  @override
  State<ListCard> createState() => _ListCardState();
}

bool ischecked = false;

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    final title = widget.title;
    final date = widget.date;
    final time = widget.time;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
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
        // width: 100,
        // height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(
                height: 5,
              ),
              Text("$date, $time",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12))
            ],
          ),
        ),
      ),
    );
  }
}
