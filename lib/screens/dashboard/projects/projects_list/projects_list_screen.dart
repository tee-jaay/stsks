import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../auth/sign-in/sign_in.dart';
import '../../../../controllers/auth_controller.dart';
import '../../../home/home_screen.dart';
import '../../dashboard_screen.dart';
import './inc/body.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({Key? key}) : super(key: key);

  static String screenId = "project_list";

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = Provider.of<AuthController>(context, listen: false)
        .user
        .isAuthenticated;
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
                        onPressed: () {
                          Navigator.pushNamed(
                              context, DashboardScreen.screenId);
                        },
                        child: const Text("Dashboard"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey,
                          primary: Colors.white,
                        ),
                        onPressed: null,
                        child: const Text(
                          "Projects",
                          style: TextStyle(color: Colors.white),
                        ),
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
