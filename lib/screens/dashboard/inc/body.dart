import 'package:flutter/material.dart';
import 'package:stasks/screens/dashboard/inc/latest_issues.dart';
import 'package:stasks/screens/dashboard/inc/online_users.dart';
import 'package:stasks/screens/dashboard/inc/stat_cards_grid.dart';
import 'package:stasks/screens/dashboard/inc/welcome_date.dart';
import 'package:stasks/screens/dashboard/inc/recent_projects.dart';
import '../../../constants.dart';
import 'tasks_status_graph.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(stDefaultSpace),
        child: Column(
          children: [
            welcomeDate(),
            const SizedBox(
              height: stDefaultSpace * 1.4,
            ),
            // const StatCards(),
            const SizedBox(height: 380.0, child: StatCardsGrid()),
            const SizedBox(
              height: stDefaultSpace,
            ),
            const RecentProjects(),
            const SizedBox(
              height: stDefaultSpace,
            ),
            TasksStatusGraph(),
            const SizedBox(
              height: stDefaultSpace,
            ),
            const LatestIssues(),
            const SizedBox(
              height: stDefaultSpace,
            ),
            const OnlineUsers(),
            const SizedBox(
              height: stDefaultSpace,
            ),
          ],
        ),
      ),
    );
  }
}
