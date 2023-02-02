import 'package:flutter/material.dart';

import 'components/comment/comment.dart';

class ProjectComments extends StatelessWidget {
  ProjectComments({required this.comments, Key? key}) : super(key: key);
  List<dynamic> comments;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) => Comment(
                comment: comments[index]["comment"],
                commentBy: comments[index]["commentBy"]),
          ),
        )
      ],
    );
  }
}
