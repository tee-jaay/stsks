import 'package:flutter/material.dart';

import 'comment_create.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
    required this.comments,
    required this.issueId,
  });

  final List comments;
  final String issueId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            child: ListView.builder(
              itemBuilder: (ctx, i) => ListTile(
                title: Text(comments[i]["text"]),
                subtitle: Text(comments[i]["commentBy"]),
              ),
              itemCount: comments.length,
            ),
          ),
          CommentCreate(issueId: issueId),
        ],
      ),
    );
  }
}
