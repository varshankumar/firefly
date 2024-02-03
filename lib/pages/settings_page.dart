import 'package:firefly/models/setting_option.dart';
import 'package:flutter/material.dart';

List settings = [
  SettingOption(title: "Account", icon: Icons.person, onPressed: () {  },),
  SettingOption(title: "Devices", icon: Icons.devices, onPressed: () {  },),
  SettingOption(title: "Location", icon: Icons.my_location, onPressed: () {  },),
];

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        itemBuilder: ((context, index) {
          return settings[index];
        }),
        separatorBuilder: ((context, index) {
          return const Divider(color: Colors.grey,);
        }),
        itemCount: settings.length);
  }
}
