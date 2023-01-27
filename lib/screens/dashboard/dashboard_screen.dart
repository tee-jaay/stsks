import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/project_controller.dart';
import 'inc/body.dart';
import 'projects/projects_list/projects_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static String screenId = "dashboard";

  void _handleClickProjects(String accessToken) {
    ProjectController projectController = ProjectController();
    print('_handleClickProjects: $accessToken');
    projectController.index(6, accessToken);
  }

  @override
  Widget build(BuildContext context) {
    final accessToken = Provider.of<AuthController>(context, listen: false).user.accessToken;
    print('Dashboard token $accessToken');
    return   Scaffold(
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
              onPressed: () {},
              child: const Text("Dashboard"),
            ),
            TextButton(
              onPressed: () {
                _handleClickProjects(accessToken);
                Navigator.pushNamed(context, ProjectListScreen.screenId);
              },
              child: const Text("Projects"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Users"),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: const Body(),
    );
  }
}
