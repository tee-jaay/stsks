import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  static String screenId = "settings";

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Setting screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
