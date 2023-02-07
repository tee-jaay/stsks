import 'package:flutter/material.dart';

import '../../../../../settings/constants.dart';
import '../../../../../models/task.dart';

class TaskDetailDialog extends StatelessWidget {
  TaskDetailDialog({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: Text(task.title),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.description),
              const SizedBox(
                height: appDefaultSpace,
              ),
              Text('Created By: ${task.createdBy}'),
              const SizedBox(
                height: appDefaultSpace,
              ),
              Text('Status: ${task.status}'),
              const SizedBox(
                height: appDefaultSpace,
              ),
              Text('Priority: ${task.priority}'),
              const SizedBox(
                height: appDefaultSpace,
              ),
              Text('Planned Start: ${task.plannedStart}'),
              const SizedBox(
                height: appDefaultSpace,
              ),
              Text('Planned End: ${task.plannedEnd}'),
              const SizedBox(
                height: appDefaultSpace * 2,
              ),
              Text('Actual Start: ${task.actualStart}'),
              const SizedBox(
                height: appDefaultSpace,
              ),
              Text('Actual End: ${task.actualEnd}'),
              const SizedBox(
                height: appDefaultSpace,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Update'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
