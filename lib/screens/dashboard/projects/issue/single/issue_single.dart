import 'package:flutter/material.dart';

import '../../../../../settings/constants.dart';
import '../detail/IssueDetail.dart';
import '../comments/comments_list.dart';

class IssueSingle extends StatelessWidget {
  IssueSingle({
    required this.issues,
    required this.index,
    super.key,
  });

  List issues;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      color: Colors.grey,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IssueDetail(issue: issues[index]),
              SizedBox(
                height: appDefaultSpace,
              ),
              CommentsList(
                comments: issues[index].comments,
                issueId: issues[index].id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
