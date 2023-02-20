import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../settings/constants.dart';
import '../../../../../controllers/auth_controller.dart';
import '../../../../../controllers/project_controller.dart';
import '../../../../../helpers/countProjectsByStatus.dart';
import 'project_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  Future<void> _refreshProjects(BuildContext context) async {
    final accessToken =
        Provider.of<AuthController>(context, listen: false).user.accessToken;
    await Provider.of<ProjectController>(context, listen: false)
        .index(limit: 6, accessToken: accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 90,
        child: FutureBuilder(
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => _refreshProjects(context),
                  child: Consumer<ProjectController>(
                    builder: (context, value, child) => Card(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Padding(
                          padding: const EdgeInsets.all(appDefaultSpace * 0.4),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total: ${value.projects.length}'),
                                  Text(
                                      'Active: ${countProjectsByStatus(value.projects, 'active')}'),
                                  Text(
                                      'Review: ${countProjectsByStatus(value.projects, 'review')}'),
                                ],
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: value.projects.length,
                                  itemBuilder: (context, index) => ProjectCard(
                                      id: value.projects[index].id,
                                      title: value.projects[index].title,
                                      imgUrl: value.projects[index].imgUrl,
                                      status: value.projects[index].status,
                                      commentsCount:
                                          value.projects[index].commentsCount),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          future: _refreshProjects(context),
        ),
      ),
    );
  }
}
