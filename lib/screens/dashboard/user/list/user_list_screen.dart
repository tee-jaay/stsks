import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);
  static String screenId = "user_list";

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "User projects_list screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
