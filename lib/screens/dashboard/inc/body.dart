import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:stasks/screens/dashboard/inc/latest_issues.dart';
import 'package:stasks/screens/dashboard/inc/welcomeDate.dart';
import 'package:stasks/screens/dashboard/inc/recent_projects.dart';
import '../../../constants.dart';
import 'stat_cards.dart';
import 'tasks_status_graph.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(stDefaultSpace),
        child: Column(
          children: [
            welcomeDate(),
            SizedBox(
              height: stDefaultSpace * 1.4,
            ),
            StatCards(),
            SizedBox(
              height: stDefaultSpace,
            ),
            RecentProjects(),
            SizedBox(
              height: stDefaultSpace,
            ),
            TasksStatusGraph(),
            SizedBox(
              height: stDefaultSpace,
            ),
            LatestIssues(),
            SizedBox(
              height: stDefaultSpace,
            ),
          ],
        ),
      ),
    );
  }
}
