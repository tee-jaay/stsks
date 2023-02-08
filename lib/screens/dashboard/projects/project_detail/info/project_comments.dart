import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/project_controller.dart';
import '../../../../../controllers/auth_controller.dart';
import '../../../../../settings/constants.dart';
import 'components/comment/comment.dart';

class ProjectComments extends StatelessWidget {
  ProjectComments({required this.projectId, required this.comments, Key? key})
      : super(key: key);
  String projectId;
  List<dynamic> comments;

  _handleSubmit({
    required String text,
    required String commentBy,
    required String accessToken,
    required String projectId,
  }) {
    ProjectController projectController = ProjectController();
    projectController.commentStore(
        comment: text,
        commentBy: commentBy,
        accessToken: accessToken,
        projectId: projectId);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context, listen: false).user;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) => Comment(
                  comment: comments[index]["comment"],
                  commentBy: comments[index]["commentBy"]),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: appDefaultSpace, vertical: appDefaultSpace * 2),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: TextField(
            onSubmitted: (value) => _handleSubmit(
                text: value.toString(),
                commentBy: user.username,
                accessToken: user.accessToken,
                projectId: projectId),
            autofocus: true,
            decoration: InputDecoration(
              hintText: '...',
            ),
          ),
        ),
      ],
    );
  }
}
