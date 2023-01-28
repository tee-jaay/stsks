import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../controllers/auth_controller.dart';
import '../../../../../../controllers/task_controller.dart';

class Body extends StatelessWidget {
  Body({required this.projectId, Key? key}) : super(key: key);
  String projectId;

  Future<void> _refreshProjectTasks(BuildContext context, id, token) async {
    await Provider.of<TaskController>(context, listen: false)
        .index(projectId: id, accessToken: token);
  }

  @override
  Widget build(BuildContext context) {
    final accessToken =
        Provider.of<AuthController>(context, listen: false).user.accessToken;
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: FutureBuilder(
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () =>
                      _refreshProjectTasks(context, projectId, accessToken),
                  child: Consumer<TaskController>(
                    builder: (context, value, child) => ListView.builder(
                      itemCount: value.tasksPreviews.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            print(value.tasksPreviews[index].id);
                            print(value.tasksPreviews[index].projectId);
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.tasksPreviews[index].title,
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                      Text(
                                        value.tasksPreviews[index].status,
                                        style: TextStyle(color: Colors.cyan),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    'Priority: ${value.tasksPreviews[index].priority}',
                                    style: TextStyle(
                                        color: Colors.black87,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
          future: _refreshProjectTasks(context, projectId, accessToken),
        ),
      ),
    );
  }
}
