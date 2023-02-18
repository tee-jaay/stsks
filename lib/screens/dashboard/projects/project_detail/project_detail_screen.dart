import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../home/home_screen.dart';
import '../projects_list/projects_list_screen.dart';
import '../../../auth/sign-in/sign_in.dart';
import '../../../../settings/constants.dart';
import '../../../../widgets/app_drawer.dart';
import '../../../../controllers/project_controller.dart';
import '../../../../controllers/auth_controller.dart';
import '../../dashboard_screen.dart';
import 'stats/project_stats.dart';
import 'info/project_comments.dart';
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
    final accessToken =
        Provider.of<AuthController>(context, listen: false).user.accessToken;
    final isAuthenticated = Provider.of<AuthController>(context, listen: false)
        .user
        .isAuthenticated;

    return !isAuthenticated
        ? const SignInScreen()
        : Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black87),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, DashboardScreen.screenId);
                        },
                        child: const Text("Dashboard"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey,
                          primary: Colors.white,
                        ),
                        onPressed: () => Navigator.pushNamed(
                            context, ProjectListScreen.screenId),
                        child: const Text(
                          "Projects",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print("users");
                          }
                        },
                        child: const Text("Users"),
                      ),
                    ],
                  ),
                ),
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
                IconButton(
                  color: Colors.black,
                  onPressed: () {
                    Provider.of<AuthController>(context, listen: false)
                        .singOut();
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.screenId);
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: FutureBuilder(
              future: Provider.of<ProjectController>(context, listen: false)
                  .show(id: id, accessToken: accessToken),
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
                        ProjectComments(
                          projectId: value.projectDetail.id,
                          comments: value.projectDetail.comments,
                        ),
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
