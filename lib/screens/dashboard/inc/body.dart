import 'package:flutter/material.dart';

import '../../../settings/constants.dart';
import 'latest_issues.dart';
import 'online_users.dart';
import 'recent_projects.dart';
import 'stat_cards_grid.dart';
import 'tasks_status_graph.dart';
import 'welcome_date.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(appDefaultSpace),
        child: Column(
          children: [
            welcomeDate(),
            const SizedBox(
              height: appDefaultSpace * 1.4,
            ),
            // const StatCards(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.54,
              child: StatCardsGrid(),
            ),
            const SizedBox(
              height: appDefaultSpace,
            ),
            const RecentProjects(),
            const SizedBox(
              height: appDefaultSpace,
            ),
            TasksStatusGraph(),
            const SizedBox(
              height: appDefaultSpace,
            ),
            const LatestIssues(),
            const SizedBox(
              height: appDefaultSpace,
            ),
            const OnlineUsers(),
            const SizedBox(
              height: appDefaultSpace,
            ),
          ],
        ),
      ),
    );
  }
}
