import 'package:flutter/material.dart';

class IssuesScreen extends StatelessWidget {
  static String screenId = "issues_list_screen";
  const IssuesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Issues'),),
      body: Center(
        child: Text(
          "Issues screen",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
