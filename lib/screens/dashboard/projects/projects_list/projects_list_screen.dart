import 'package:flutter/material.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Projects List screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
