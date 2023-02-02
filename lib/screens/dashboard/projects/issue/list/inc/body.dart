import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prozeqts/settings/constants.dart';

import '../../../../../../controllers/auth_controller.dart';
import '../../../../../../controllers/issue_controller.dart';

class Body extends StatelessWidget {
  Body({required this.projectId, Key? key}) : super(key: key);
  String projectId;

  Future<void> _refreshProjectIssues(
      BuildContext context, id, accessToken) async {
    await Provider.of<IssueController>(context, listen: false)
        .index(projectId: id, accessToken: accessToken);
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
                      _refreshProjectIssues(context, projectId, accessToken),
                  child: Consumer<IssueController>(
                    builder: (context, value, child) => ListView.builder(
                      itemCount: value.issues.length,
                      itemBuilder: (context, index) => Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.issues[index].title,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                                Text(
                                  value.issues[index].description,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                                Text(
                                  value.issues[index].createdBy,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                                Text(
                                  value.issues[index].priority,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                                Text(
                                  value.issues[index].status,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                                Text(
                                  value.issues[index].start,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                                Text(
                                  value.issues[index].end,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                                Text(
                                  value.issues[index].bookmark,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                                Text(
                                  value.issues[index].severity,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                                Text(
                                  value.issues[index].type,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                                SingleChildScrollView(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: appDefaultSpace),
                                    color: Colors.grey.withOpacity(0.2),
                                    height:
                                        MediaQuery.of(context).size.height * 0.2,
                                    child: ListView.builder(
                                      itemBuilder: (ctx, i) => ListTile(
                                        title: Text(value
                                            .issues[index].comments[i]["text"]),
                                        subtitle: Text(value.issues[index]
                                            .comments[i]["commentBy"]),
                                      ),
                                      itemCount:
                                          value.issues[index].comments.length,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          future: _refreshProjectIssues(context, projectId, accessToken),
        ),
      ),
    );
  }
}
