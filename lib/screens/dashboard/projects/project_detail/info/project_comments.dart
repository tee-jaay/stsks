import 'package:flutter/material.dart';

import '../discussion/discussion_comment_add.dart';
import '../discussion/discussion_comments_list.dart';

class ProjectComments extends StatelessWidget {
  const ProjectComments(
      {required this.projectId, required this.comments, Key? key})
      : super(key: key);
  final String projectId;
  final List<dynamic> comments;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DiscussionCommentsList(comments: comments),
        DiscussionCommentAdd(projectId: projectId),
      ],
    );
  }
}
