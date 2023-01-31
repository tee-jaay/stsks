import 'package:flutter/material.dart';

import './inc/body.dart';

class IssuesListScreen extends StatelessWidget {
  static String screenId = "issues_list_screen";

  const IssuesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var projectId = ModalRoute.of(context)?.settings.arguments.toString();
    return Scaffold(
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
