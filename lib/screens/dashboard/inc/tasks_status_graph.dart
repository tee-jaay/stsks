import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../../../settings/constants.dart';

class TasksStatusGraph extends StatelessWidget {
  TasksStatusGraph({required this.tasks, Key? key}) : super(key: key);
  List tasks;

  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> tasksData = tasks
        .map((taskCount) =>
            {'priority': taskCount.priority, 'count': taskCount.count})
        .toList();

       return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tasks Priorities",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 300.00,
          width: 360.00,
          child: Chart(
            data: tasksData,
            variables: {
              'x': Variable(
                accessor: (Map map) => map['priority'] as String,
              ),
              'y': Variable(
                accessor: (Map map) => map['count'] as num,
              ),
            },
            elements: [IntervalElement()],
            axes: [
              Defaults.horizontalAxis,
              Defaults.verticalAxis,
            ],
          ),
        ),
        const SizedBox(
          height: appDefaultSpace,
        ),
      ],
    );
  }
}
