import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prozeqts/controllers/auth_controller.dart';

import '../../../../../controllers/issue_controller.dart';

class IssueCreateScreen extends StatefulWidget {
  static String screenId = "issues_create_screen";

  const IssueCreateScreen({Key? key}) : super(key: key);

  @override
  State<IssueCreateScreen> createState() => _IssueCreateScreenState();
}

class _IssueCreateScreenState extends State<IssueCreateScreen> {
  // String title;
  // String description;
  // String bookmark;
  // String status;
  // String start;
  // String end;
  // String priority;
  // String type;
  // String severity;
  _handleSubmit(
      {required String createdBy,
      required String accessToken,
      required String projectId}) {
    Object newIssue = {
      "createdBy": createdBy,
      "title": "New issue by time",
      "description": "lorem uipsum dolor sit omet",
      "bookmark": false,
      "status": "open",
      "start": DateTime.now().toString(),
      "end": "2023-2-18",
      "priority": "medium",
      "type": "upgrade",
      "severity": "critical"
    };
    IssueController issueController = IssueController();
    issueController
        .store(projectId: projectId, accessToken: accessToken, obj: newIssue)
        .then((value) => print(value.toString()))
        .catchError((err) => print(err.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final projectId = ModalRoute.of(context)!.settings.arguments.toString();
    final user = Provider.of<AuthController>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Issue',
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Issue create screen",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
              ),
            ),
          ),
          TextButton(
              onPressed: () => _handleSubmit(
                  createdBy: user.username,
                  projectId: projectId,
                  accessToken: user.accessToken),
              child: Text('Add')),
        ],
      ),
    );
  }
}
