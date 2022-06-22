import 'package:flutter/material.dart';
import 'package:stasks/screens/dashboard/dashboard_screen.dart';
import './inc/body.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({Key? key}) : super(key: key);

  static String screenId = "project_list";

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
              onPressed: () {
                Navigator.pushNamed(context, DashboardScreen.screenId);
              },
              child: Text("Dashboard"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
                primary: Colors.white,
              ),
              onPressed: null,
              child: Text(
                "Projects",
                style: TextStyle(color: Colors.white),
              ),
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
