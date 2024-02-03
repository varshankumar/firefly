import 'package:flutter/material.dart';

class SettingOption extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  SettingOption(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});
  @override
  State<StatefulWidget> createState() => _SettingOptionState();
}

class _SettingOptionState extends State<SettingOption> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(
            widget.icon,
            color: Colors.deepOrange,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
