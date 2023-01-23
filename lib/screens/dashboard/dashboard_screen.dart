import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../controllers/issue_controller.dart';
import '../../controllers/meeting_controller.dart';
import '../../controllers/task_controller.dart';
import '../../controllers/project_controller.dart';
import '../../controllers/user_controller.dart';
import 'inc/body.dart';
import 'projects/projects_list/projects_list_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static String screenId = "dashboard";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void _handleClickProjects() {
    ProjectController projectController = ProjectController();
    projectController.index();
  }

  void _handleClickUsers() {
    UserController userController = UserController();
    userController.index();
  }

  void _handleClickIssues() {
    IssueController issueController = IssueController();
    issueController.index();
  }

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
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey,
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
                _handleClickProjects();
                Navigator.pushNamed(context, ProjectListScreen.screenId);
              },
              child: const Text("Projects"),
            ),
            TextButton(
              onPressed: () {
                // _handleClickUsers();
                // _handleClickIssues();
                // _handleClickMeetings();
                // _handleClickTasks();
              },
              child: const Text("Users List"),
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

void _handleClickMeetings() {
  MeetingController meetingController = MeetingController();
  meetingController.index();
}

void _handleClickTasks() {
  TaskController taskController = TaskController();
  taskController.index();
}
