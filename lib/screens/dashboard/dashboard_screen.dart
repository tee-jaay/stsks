import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static String screenId = "dashboard_screen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime todayDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(stDefaultSpace),
        child: Row(
          children: [
            const Text("Welcome to Dashboard", style: TextStyle(fontWeight: FontWeight.bold),),
            const Spacer(),
            Text(formatDate(todayDate, [yy, '-', M, '-', d])),
          ],
        ),
      ),
    );
  }
}
