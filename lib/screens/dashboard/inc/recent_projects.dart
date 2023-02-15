import 'package:flutter/material.dart';

import '../../../helpers/ProjectStatusColor.dart';
import '../../../models/dashboard.dart';
import '../projects/project_detail/project_detail_screen.dart';
import '../../../settings/constants.dart';
import 'recent_projects_item.dart';

class RecentProjects extends StatefulWidget {
  RecentProjects({
    required this.recentProjects,
    Key? key,
  }) : super(key: key);

  List<RecentProject> recentProjects;

  @override
  State<RecentProjects> createState() => _RecentProjectsState();
}

class _RecentProjectsState extends State<RecentProjects> {
  @override
  Widget build(BuildContext context) {
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
            ), SizedBox(
                  height: widget.recentProjects.length * 44.2,
                  child: ListView.builder(
                    itemBuilder: (context, index) => RecentProjectItem(
                      color: getColorForProjectStatus(
                          widget.recentProjects[index].status),
                      title: widget.recentProjects[index].title,
                      press: () {
                        Navigator.pushNamed(
                            context, ProjectDetailScreen.screenId,
                            arguments: widget.recentProjects[index].id);
                      },
                      date: widget.recentProjects[index].status,
                    ),
                    itemCount: widget.recentProjects.length,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
