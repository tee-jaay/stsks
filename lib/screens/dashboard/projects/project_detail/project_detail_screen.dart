import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../../controllers/project_controller.dart';
import 'info/project_info.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({Key? key}) : super(key: key);
  static String screenId = "project_detail_screen";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          key: Key('project_detail'),
          'Detail',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<ProjectController>(context, listen: false).show(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Data has been fetched, display the data in a widget
            return Consumer<ProjectController>(
              builder: (context, value, child) {
                return ProjectInfo(
                  key: const Key('project_info'),
                  title: value.projectDetail.title,
                  description: value.projectDetail.description,
                  image: value.projectDetail.image,
                  status: value.projectDetail.status,
                  commentsCount: value.projectDetail.commentsCount,
                  estimate: value.projectDetail.estimate,
                  spent: value.projectDetail.spent,
                  createdBy: value.projectDetail.createdBy,
                  repoLink: value.projectDetail.repoLink,
                  urlOne: value.projectDetail.urlOne,
                  urlTwo: value.projectDetail.urlTwo,
                  createdAt: value.projectDetail.createdAt,
                  updatedAt: value.projectDetail.updatedAt,
                  assignees: value.projectDetail.assignees,
                );
              },
            );
          } else if (snapshot.hasError) {
            // An error occurred, display an error message
            return Text('An error occurred: ${snapshot.error}');
          } else {
            // Data is being fetched, display a loading spinner
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
