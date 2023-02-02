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

  Future<void> _showTask(BuildContext ctx, String projectId, String taskId,
      String accessToken) async {
    Provider.of<TaskController>(ctx, listen: false)
        .show(projectId: projectId, taskId: taskId, accessToken: accessToken);
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
                          onTap: () {
                            _dialogBuilder(context,
                                value.tasksPreviews[index].id, accessToken);
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.tasksPreviews[index].title,
                                        style: const TextStyle(
                                            color: Colors.black87),
                                      ),
                                      Text(
                                        value.tasksPreviews[index].status,
                                        style:
                                            const TextStyle(color: Colors.cyan),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Priority: ${value.tasksPreviews[index].priority}',
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
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

  // Task detail
  Future<void> _dialogBuilder(
      BuildContext context, String taskId, String accessToken) {
    final task = Provider.of<TaskController>(context, listen: false).task;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder(
          future: _showTask(context, projectId, taskId, accessToken),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () =>
                      _showTask(context, projectId, taskId, accessToken),
                  child: Consumer<TaskController>(
                    builder: (context, value, child) => AlertDialog(
                      title: Text(task.title),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Created By: ${task.createdBy}'),
                          Text('Status: ${task.status}'),
                          Text('Priority: ${task.priority}'),
                          Text('Planned Start: ${task.plannedStart}'),
                          Text('Planned End: ${task.plannedEnd}'),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Update'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
