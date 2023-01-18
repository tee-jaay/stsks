import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../../controllers/project_controller.dart';
import 'info/project_info.dart';

class ProjectDetailScreen extends StatelessWidget {
  final String id;

  const ProjectDetailScreen({Key? key, required this.id}) : super(key: key);
  static String screenId = "project_detail_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
              builder: (context, value, child) => ProjectInfo(
                title: value.projectDetail.title,
                description: value.projectDetail.description,
                image: value.projectDetail.image,
                status: value.projectDetail.status,
              ),
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
