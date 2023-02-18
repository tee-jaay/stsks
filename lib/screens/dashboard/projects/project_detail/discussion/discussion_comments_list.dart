import 'package:flutter/material.dart';

import 'discussion_comment_single.dart';

class DiscussionCommentsList extends StatelessWidget {
  const DiscussionCommentsList({required this.comments, Key? key}) : super(key: key);
  final List comments;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 1,
        child: ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, index) => DiscussionCommentSingle(
              comment: comments[index]["comment"],
              commentBy: comments[index]["commentBy"]),
        ),
      ),
    );
  }
}
