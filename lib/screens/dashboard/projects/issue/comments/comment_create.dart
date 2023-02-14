import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/auth_controller.dart';
import '../../../../../controllers/issue_controller.dart';
import '../../../../../settings/constants.dart';

class CommentCreate extends StatefulWidget {
  CommentCreate({
    required this.issueId,
    super.key,
  });

  String issueId;

  @override
  State<CommentCreate> createState() => _CommentCreateState();
}

class _CommentCreateState extends State<CommentCreate> {
  TextEditingController textEditingController = TextEditingController();

  void commentAdd({required String accessToken, required String commentBy}) {
    Object obj = {
      "text": textEditingController.text,
      "commentBy": commentBy,
    };
    Provider.of<IssueController>(context, listen: false)
        .commentAdd(issueId: widget.issueId, accessToken: accessToken, obj: obj)
        .then((value) {
      if (value == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Comment added',
          style: TextStyle(color: Colors.green),
        )));
        textEditingController.clear();
        Provider.of<IssueController>(context, listen: false).clearIssues();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Error occurred',
          style: TextStyle(color: Colors.orange),
        )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context).user;
    return Container(
      padding: const EdgeInsets.all(
        appDefaultSpace * 0.5,
      ),
      child: TextField(
        controller: textEditingController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: '...',
        ),
        onEditingComplete: () => commentAdd(
          accessToken: user.accessToken,
          commentBy: user.username,
        ),
      ),
    );
  }
}
