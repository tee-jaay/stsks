import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/auth_controller.dart';
import '../../../../auth/sign-in/sign_in.dart';
import './inc/body.dart';

class IssuesListScreen extends StatelessWidget {
  static String screenId = "issues_list_screen";

  const IssuesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var projectId = ModalRoute.of(context)?.settings.arguments.toString();
    final isAuthenticated =
        Provider.of<AuthController>(context).user.isAuthenticated;
    return !isAuthenticated
        ? const SignInScreen()
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                'Issues',
                style: TextStyle(color: Colors.black87),
              ),
              iconTheme: const IconThemeData(color: Colors.black87),
            ),
            body: Column(
              children: [
                Body(projectId: projectId!),
              ],
            ),
          );
  }
}
