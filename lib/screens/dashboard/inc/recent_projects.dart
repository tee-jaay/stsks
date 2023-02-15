import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/ProjectStatusColor.dart';
import '../projects/project_detail/project_detail_screen.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../settings/constants.dart';
import 'recent_projects_item.dart';

class RecentProjects extends StatefulWidget {
  const RecentProjects({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentProjects> createState() => _RecentProjectsState();
}

class _RecentProjectsState extends State<RecentProjects> {
  Future<void> _refreshRecentProjects(
      BuildContext ctx, String accessToken) async {
    Provider.of<DashboardController>(ctx, listen: false)
        .index(accessToken: accessToken);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context, listen: false).user;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: appDefaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Projects",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: appDefaultSpace * 0.5,
            ),
            FutureBuilder(
              builder: (context, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? const SizedBox(
                      height: appDefaultSpace,
                      child: Center(
                        child: Text('...'),
                      ),
                    )
                  : RefreshIndicator(
                      child: Consumer<DashboardController>(
                        builder: (context, value, child) => SizedBox(
                          height: value.recentProjects.length * 44.2,
                          child: ListView.builder(
                            itemBuilder: (context, index) => RecentProjectItem(
                              color: getColorForProjectStatus(
                                  value.recentProjects[index].status),
                              title: value.recentProjects[index].title,
                              press: () {
                                Navigator.pushNamed(
                                    context, ProjectDetailScreen.screenId,
                                    arguments: value.recentProjects[index].id);
                              },
                              date: value.recentProjects[index].status,
                            ),
                            itemCount: value.recentProjects.length,
                          ),
                        ),
                      ),
                      onRefresh: () =>
                          _refreshRecentProjects(context, user.accessToken),
                    ),
              future: _refreshRecentProjects(context, user.accessToken),
            ),
          ],
        ),
      ),
    );
  }
}
