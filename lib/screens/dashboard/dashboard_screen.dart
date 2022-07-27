import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stasks/screens/dashboard/inc/body.dart';
import 'package:stasks/screens/dashboard/projects/projects_list/projects_list_screen.dart';

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
          icon: const Icon(Icons.arrow_back),
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
                if (kDebugMode) {
                  print("Dashboard screen");
                }
              },
              child: const Text("Dashboard"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ProjectListScreen.screenId);
              },
              child: const Text("Projects"),
            ),
            TextButton(
              onPressed: () {
                if (kDebugMode) {
                  print("users");
                }
              },
              child: const Text("Users"),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              if (kDebugMode) {
                print("logout");
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: const Body(),
    );
  }
}
