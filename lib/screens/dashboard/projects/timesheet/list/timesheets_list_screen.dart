import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/auth_controller.dart';
import '../../../../auth/sign-in/sign_in.dart';
import './inc/body.dart';

class TimeSheetsScreen extends StatelessWidget {
  static String screenId = "timesheet_list_screen";

  const TimeSheetsScreen({Key? key}) : super(key: key);

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
                'Timesheet',
                style: TextStyle(color: Colors.black87),
              ),
              iconTheme: const IconThemeData(color: Colors.black87),
            ),
            body: Column(
              children: [
                Body(
                  projectId: projectId!,
                ),
              ],
            ),
          );
  }
}
