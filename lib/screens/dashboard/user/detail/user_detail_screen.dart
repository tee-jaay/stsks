import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  static String screenId = "user_detail";

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "User project_detail screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
