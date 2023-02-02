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
        title: const Text('Tasks', style: TextStyle(color: Colors.black87),),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Center(
        child: Column(
          children: [
            Body(projectId: projectId!),
          ],
        ),
      ),
    );
  }
}
