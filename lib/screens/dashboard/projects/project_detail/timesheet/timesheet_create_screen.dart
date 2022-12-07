import 'package:flutter/material.dart';

class TimeSheetCreateScreen extends StatelessWidget {
  const TimeSheetCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Timesheet create screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
