import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../create/meeting_create_screen.dart';
import '../../../../../controllers/auth_controller.dart';
import '../../../../auth/sign-in/sign_in.dart';
import 'inc/body.dart';

class MeetingsListScreen extends StatelessWidget {
  static String screenId = "meetings_list_screen";

  const MeetingsListScreen({Key? key}) : super(key: key);

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
                'Meetings',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.black87),
            ),
            body: Column(
              children: [
                Body(projectId: projectId!),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pushNamed(
                  context, MeetingCreateScreen.screenId,
                  arguments: projectId),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          );
  }
}
