import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../../settings/constants.dart';
import '../../../../widgets/app_drawer.dart';
import 'info/project_comments.dart';
import 'info/project_stats.dart';
import '../../../../controllers/project_controller.dart';
import 'info/project_info.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({Key? key}) : super(key: key);
  static String screenId = "project_detail_screen";

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text(
          key: Key('project_detail'),
          'Detail',
          style: TextStyle(color: Colors.black),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text(
                'Info',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Tab(
              child: Text(
                'Discussion',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Tab(
              child: Text(
                'Stats',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: appDefaultSpace),
            child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                )),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<ProjectController>(context, listen: false).show(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Data has been fetched, display the data in a widget
            return Consumer<ProjectController>(
              builder: (context, value, child) {
                return TabBarView(controller: _tabController, children: [
                  ProjectInfo(
                    key: const Key('project_info'),
                    title: value.projectDetail.title,
                    description: value.projectDetail.description,
                    image: value.projectDetail.image,
                    status: value.projectDetail.status,
                    commentsCount:
                        value.projectDetail.comments.length.toString(),
                    estimate: value.projectDetail.estimate,
                    spent: value.projectDetail.spent,
                    createdBy: value.projectDetail.createdBy,
                    repoLink: value.projectDetail.repoLink,
                    urlOne: value.projectDetail.urlOne,
                    urlTwo: value.projectDetail.urlTwo,
                    createdAt: value.projectDetail.createdAt,
                    updatedAt: value.projectDetail.updatedAt,
                    assignees: value.projectDetail.assignees,
                  ),
                  ProjectComments(comments: value.projectDetail.comments),
                  ProjectStats(),
                ]);
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
      drawer: AppDrawer(projectId: id),
    );
  }
}
