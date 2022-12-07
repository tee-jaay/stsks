import 'package:flutter/material.dart';

class TodosListScreen extends StatelessWidget {
  const TodosListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Todos projects_list screen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
