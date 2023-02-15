import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prozeqts/controllers/dashboard_controller.dart';

import '../auth/sign-in/sign_in.dart';
import '../home/home_screen.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/project_controller.dart';
import 'inc/body.dart';
import 'projects/projects_list/projects_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static String screenId = "dashboard";

  void _handleClickProjects(String accessToken) {
    ProjectController projectController = ProjectController();
    projectController.index(limit: 6, accessToken: accessToken);
  }

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = Provider.of<AuthController>(context, listen: false)
        .user
        .isAuthenticated;
    final accessToken =
        Provider.of<AuthController>(context, listen: false).user.accessToken;
    return !isAuthenticated
        ? const SignInScreen()
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
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
                          Navigator.pushNamed(
                              context, ProjectListScreen.screenId);
                        },
                        child: const Text("Projects"),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<DashboardController>(context, listen: false)
                              .index(accessToken: accessToken);
                        },
                        child: const Text("Fetch"),
                      ),
                    ],
                  ),
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  color: Colors.black,
                  onPressed: () {
                    Provider.of<AuthController>(context, listen: false)
                        .singOut();
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.screenId);
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
