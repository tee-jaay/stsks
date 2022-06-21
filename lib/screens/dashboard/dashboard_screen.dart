import 'package:flutter/material.dart';
import 'package:stasks/screens/dashboard/inc/body.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static String screenId = "dashboard";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
                primary: Colors.white,
              ),
              onPressed: () {
                print("Dashboard screen");
              },
              child: Text("Dashboard"),
            ),
            TextButton(
              onPressed: () {
                print("projects");
              },
              child: Text("Projects"),
            ),
            TextButton(
              onPressed: () {
                print("users");
              },
              child: Text("Users"),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              print("logout");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
