import 'package:flutter/material.dart';

class TimeSheetsScreen extends StatelessWidget {
  static String screenId = "timesheet_list_screen";
  const TimeSheetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timesheet'),),
      body: Center(
        child: Text(
          "Timesheet screen",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
