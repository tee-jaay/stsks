import 'package:flutter/material.dart';

class TaskCreateScreen extends StatelessWidget {
  const TaskCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Task create screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
