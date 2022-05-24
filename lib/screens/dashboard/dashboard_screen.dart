import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static String screenId = "dashboard_screen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(stDefaultSpace),
        child: Row(
          children: const [
            Text("Welcome to Dashboard", style: TextStyle(fontWeight: FontWeight.bold),),
            Spacer(),
            Text("Date")
          ],
        ),
      ),
    );
  }
}
