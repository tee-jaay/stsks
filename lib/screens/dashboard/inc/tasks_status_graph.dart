import 'package:flutter/material.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:graphic/graphic.dart';
import 'package:stasks/settings/constants.dart';

class TasksStatusGraph extends StatelessWidget {
  final Color darkBlue = const Color.fromARGB(255, 18, 32, 47);

  final List<Feature> features = [
    Feature(
      title: "Active",
      color: Colors.blue,
      data: [0.2, 0.8, 0.4, 0.7, 0.6],
    ),
    Feature(
      title: "Complete",
      color: Colors.pink,
      data: [1, 0.8, 0.6, 0.7, 0.3],
    ),
    Feature(
      title: "Review",
      color: Colors.cyan,
      data: [0.5, 0.4, 0.85, 0.4, 0.7],
    ),
    Feature(
      title: "Active",
      color: Colors.green,
      data: [0.6, 0.2, 0, 0.1, 1],
    ),
    Feature(
      title: "Cancelled",
      color: Colors.amber,
      data: [0.25, 1, 0.3, 0.8, 0.6],
    ),
  ];

  final List<Map> data = [
    {'category': 'Active', 'sales': 5},
    {'category': 'Review', 'sales': 20},
    {'category': 'Cancelled', 'sales': 36},
    {'category': 'Complete', 'sales': 10},
    {'category': 'Not Started', 'sales': 10},
  ];

  TasksStatusGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "All Tasks Status",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          height: 300.00,
          width: 360.00,
          child: Chart(
            data: data,
            variables: {
              'category': Variable(
                accessor: (Map map) => map['category'] as String,
              ),
              'sales': Variable(
                accessor: (Map map) => map['sales'] as num,
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
          height: stDefaultSpace,
        ),
      ],
    );
  }
}
