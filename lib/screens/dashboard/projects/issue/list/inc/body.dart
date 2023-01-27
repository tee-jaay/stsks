import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                      itemBuilder: (context, index) => Text(
                        value.issues[index].title,
                        style: const TextStyle(color: Colors.black87),
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
