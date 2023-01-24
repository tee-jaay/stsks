import 'package:flutter/material.dart';

class MeetingsListScreen extends StatelessWidget {
  static String screenId = "meetings_list_screen";

  const MeetingsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Issues'),
      ),
      body: Center(
        child: Text(
          "Meetings List Screen",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
