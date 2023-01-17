import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/project_controller.dart';
import 'project_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  Future<void> _refreshProjects(BuildContext context) async {
    await Provider.of<ProjectController>(context, listen: false).index();
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
                    builder: (context, value, child) => ListView.builder(
                      itemCount: value.projects.length,
                      itemBuilder: (context, index) => ProjectCard(
                          id: value.projects[index].id,
                          title: value.projects[index].title,
                          imgUrl: value.projects[index].imgUrl,
                          status: value.projects[index].status,
                          commentsCount: value.projects[index].commentsCount),
                    ),
                  ),
                ),
          future: _refreshProjects(context),
        ),
      ),
    );
  }
}
