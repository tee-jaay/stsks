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
        title: Text('Issues'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "Issues screen",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
              ),
            ),
          ),
          Body(projectId: projectId!),
        ],
      ),
    );
  }
}
