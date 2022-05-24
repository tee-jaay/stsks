import 'package:flutter/material.dart';

class IssueCreateScreen extends StatelessWidget {
  const IssueCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Issue create screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
