import 'package:firefly/pages/live_view.dart';
import 'package:firefly/pages/notification_page.dart';
import 'package:firefly/pages/settings_page.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  final int page;

  const Main({super.key, required this.page});
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    if (widget.page == 0) {
      return const LiveView();
    } else if (widget.page == 1) {
      return const NotificationPage();

    } else if (widget.page == 2) {
      return const SettingsPage();
    }
    return const SizedBox();
  }
}
