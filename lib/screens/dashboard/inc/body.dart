import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../settings/constants.dart';
import 'latest_issues.dart';
import 'online_users.dart';
import 'recent_projects.dart';
import 'stat_cards_grid.dart';
import 'tasks_status_graph.dart';
import 'welcome_date.dart';

class Body extends StatefulWidget {
  Body({required this.accessToken, Key? key}) : super(key: key);
  String accessToken;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    _refreshDashboardData(context, widget.accessToken);
  }

  Future<void> _refreshDashboardData(
      BuildContext ctx, String accessToken) async {
    Provider.of<DashboardController>(ctx, listen: false)
        .index(accessToken: accessToken);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context).user;
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(appDefaultSpace),
            child: FutureBuilder(
              builder: (context, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? const SizedBox(
                      height: appDefaultSpace,
                      child: Center(
                        child: Text('...'),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () =>
                          _refreshDashboardData(context, user.accessToken),
                      child: Consumer<DashboardController>(
                        builder: (context, value, child) => Column(
                          children: [
                            const WelcomeDate(),
                            const SizedBox(
                              height: appDefaultSpace * 1.4,
                            ),
                            // const StatCards(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.54,
                              child: StatCardsGrid(
                                statData: Provider.of<DashboardController>(
                                        context,
                                        listen: false)
                                    .statData,
                              ),
                            ),
                            const SizedBox(
                              height: appDefaultSpace * 0.5,
                            ),
                            RecentProjects(
                              recentProjects: Provider.of<DashboardController>(
                                      context,
                                      listen: false)
                                  .recentProjects,
                            ),
                            const SizedBox(
                              height: appDefaultSpace,
                            ),
                            TasksStatusGraph(),
                            const SizedBox(
                              height: appDefaultSpace,
                            ),
                            LatestIssues(latestOpenIssues:Provider.of<DashboardController>(
                                context,
                                listen: false)
                                .latestOpenIssues,),
                            const SizedBox(
                              height: appDefaultSpace,
                            ),
                            OnlineUsers(
                                usersOnline:Provider.of<DashboardController>(
                                    context,
                                    listen: false)
                                    .usersOnline,
                            ),
                            const SizedBox(
                              height: appDefaultSpace,
                            ),
                          ],
                        ),
                      ),
                    ),
            )));
  }
}
