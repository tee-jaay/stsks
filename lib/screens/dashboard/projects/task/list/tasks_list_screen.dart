import 'package:flutter/material.dart';

import './inc/body.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({Key? key}) : super(key: key);
  static String screenId = "tasks_list_screen";

  @override
  Widget build(BuildContext context) {
    final projectId = ModalRoute.of(context)?.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects Tasks'),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Tasks projects tasks screen",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
              ),
            ),
            Body(projectId: projectId!),
          ],
        ),
      ),
    );
  }
}
