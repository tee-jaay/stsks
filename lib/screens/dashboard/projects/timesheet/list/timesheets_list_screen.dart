import 'package:flutter/material.dart';

import './inc/body.dart';

class TimeSheetsScreen extends StatelessWidget {
  static String screenId = "timesheet_list_screen";
  const TimeSheetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projectId = ModalRoute.of(context)?.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(title: const Text('Timesheet'),),
      body: Column(
        children:  [
          const Center(
            child: Text(
              "Timesheet screen",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
              ),
            ),
          ),
          Body(projectId: projectId!,),
        ],
      ),
    );
  }
}
