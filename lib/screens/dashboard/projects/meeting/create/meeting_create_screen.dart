import 'package:flutter/material.dart';

class MeetingCreateScreen extends StatelessWidget {
  static String screenId = "meetings_create_screen";
  const MeetingCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Meeting create screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
