import 'package:flutter/material.dart';

import '../screens/dashboard/projects/issue/list/issues_list_screen.dart';
import '../screens/dashboard/projects/meeting/meetings_list_screen.dart';
import '../screens/dashboard/projects/task/list/tasks_list_screen.dart';
import '../screens/dashboard/projects/timesheet/timesheets_list_screen.dart';

class AppDrawer extends StatelessWidget {
  String projectId;

  AppDrawer({required this.projectId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'Project',
              style: TextStyle(color: Colors.black87),
            ),
            automaticallyImplyLeading: false,
            leading: Icon(
              Icons.web,
              color: Colors.black87,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text(
              'Tasks',
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(TasksListScreen.screenId, arguments: projectId);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.check),
            title: const Text(
              'Issues',
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(IssuesListScreen.screenId, arguments: projectId);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text(
              'Timesheet',
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(TimeSheetsScreen.screenId, arguments: projectId);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.meeting_room),
            title: const Text(
              'Meetings',
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(MeetingsListScreen.screenId, arguments: projectId);
            },
          ),
        ],
      ),
    );
  }
}
