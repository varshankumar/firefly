import 'package:firefly/widgets/notification_box.dart';
import 'package:flutter/material.dart';

final notifications = [
  NotificationBox(
    title: "N1",
    message: "N1 message",
    time: DateTime.now(),
  ),
  NotificationBox(
    title: "N2",
    message: "N2 message",
    time: DateTime.now(),
  ),
  NotificationBox(
    title: "N3",
    message: "N3 message",
    time: DateTime.now(),
  ),
];

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return notifications[index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: 3);
  }
}
