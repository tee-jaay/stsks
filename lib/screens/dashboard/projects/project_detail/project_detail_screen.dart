import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../../controllers/project_controller.dart';
import 'info/project_info.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({Key? key}) : super(key: key);

  static String screenId = "project_detail_screen";

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    Provider.of<ProjectController>(context, listen: false).show(id);
    final project =
        Provider.of<ProjectController>(context, listen: false).projectDetail;

    bool loading =
        Provider.of<ProjectController>(context, listen: false).loading;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                ProjectInfo(
                  title: project.title,
                  description: project.description,
                ),
              ],
            ),
    );
  }
}
