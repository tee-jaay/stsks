import 'package:flutter/material.dart';

class MeetingCreateScreen extends StatelessWidget {
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
