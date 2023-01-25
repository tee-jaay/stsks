import 'package:flutter/material.dart';

import 'inc/body.dart';

class MeetingsListScreen extends StatelessWidget {
  static String screenId = "meetings_list_screen";

  const MeetingsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projectId = ModalRoute.of(context)?.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetings'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Meetings List Screen",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
              ),
            ),
          ),
          Body(projectId:projectId!),
        ],
      ),
    );
  }
}
