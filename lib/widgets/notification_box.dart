import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationBox extends StatelessWidget {
  String title;
  String message;
  DateTime time;

  NotificationBox(
      {super.key,
      required this.title,
      required this.message,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
Column(children: [Text(title, style: const TextStyle(fontSize: 30, color: Colors.white),),
        const SizedBox(width: 10,),
        Text(message, style: const TextStyle(color: Colors.white),),],),
        const SizedBox(width: 10,),
        Text(DateFormat.yMEd().format(time), style: const TextStyle(color: Colors.grey))
      ]),
    );
  }
}
