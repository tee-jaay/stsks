import 'package:flutter/material.dart';

class TaskCreateScreen extends StatelessWidget {
  static String screenId = "task_create_screen";

  const TaskCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black87,
              )),
        ],
      ),
      body: const Center(
        child: Text(
          "Task create screen",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
