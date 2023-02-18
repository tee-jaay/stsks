import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../settings/constants.dart';

class ProjectStats extends StatelessWidget {
  final Map<String, int> taskStatus = {
    'active': 20,
    'cancelled': 5,
    'completed': 40,
    'review': 10,
    'not started': 25,
  };

  ProjectStats({super.key});

  @override
  Widget build(BuildContext context) {
    // Convert the Map into a List of MapEntry objects
    final entries = taskStatus.entries.toList();

// Convert the List of MapEntry objects into a List of Map<String, int>
    final data =
        entries.map((entry) => {'x': entry.key, 'y': entry.value}).toList();

// Create the PieSeries with the modified data parameter
    final series = <PieSeries>[
      PieSeries<Map<String, dynamic>, String>(
        dataSource: data,
        xValueMapper: (datum, _) => datum['x'],
        yValueMapper: (datum, _) => datum['y'],
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
        ),
      ),
    ];

    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(height: appDefaultSpace),
          Text('Tasks'),
          SizedBox(height: appDefaultSpace * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatusValue(
                status: 'active',
                value: 20,
              ),
              StatusValue(
                status: 'cancelled',
                value: 5,
              ),
              StatusValue(
                status: 'completed',
                value: 40,
              ),
            ],
          ),
          SizedBox(height: appDefaultSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatusValue(
                status: 'review',
                value: 10,
              ),
              StatusValue(
                status: 'not started',
                value: 25,
              ),
            ],
          ),
          SizedBox(
            height: 400,
            child: SfCircularChart(
              series: series,
            ),
          ),
        ],
      ),
    );
  }
}

class StatusValue extends StatelessWidget {
  const StatusValue({
    required this.status,
    required this.value,
    super.key,
  });

  final String status;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Text('$status: $value');
  }
}
