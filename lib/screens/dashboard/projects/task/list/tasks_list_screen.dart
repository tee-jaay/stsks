import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/auth_controller.dart';
import '../../../../auth/sign-in/sign_in.dart';
import './inc/body.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({Key? key}) : super(key: key);
  static String screenId = "tasks_list_screen";

  @override
  Widget build(BuildContext context) {
    final projectId = ModalRoute.of(context)?.settings.arguments.toString();
    final isAuthenticated =
        Provider.of<AuthController>(context).user.isAuthenticated;
    return !isAuthenticated
        ? const SignInScreen()
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                'Tasks',
                style: TextStyle(color: Colors.black87),
              ),
              iconTheme: const IconThemeData(color: Colors.black87),
            ),
            body: Center(
              child: Column(
                children: [
                  Body(projectId: projectId!),
                ],
              ),
            ),
          );
  }
}
