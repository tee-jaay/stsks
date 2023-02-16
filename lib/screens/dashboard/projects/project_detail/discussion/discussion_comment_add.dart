import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/auth_controller.dart';
import '../../../../../controllers/project_controller.dart';
import '../../../../../settings/constants.dart';

class DiscussionCommentAdd extends StatefulWidget {
  const DiscussionCommentAdd({required this.projectId, Key? key})
      : super(key: key);
  final String projectId;

  @override
  State<DiscussionCommentAdd> createState() => _DiscussionCommentAddState();
}

class _DiscussionCommentAddState extends State<DiscussionCommentAdd> {
  final TextEditingController _commentTextController = TextEditingController();

  _handleSubmit({
    required BuildContext ctx,
    required String text,
    required String commentBy,
    required String accessToken,
    required String projectId,
  }) {
    Provider.of<ProjectController>(ctx, listen: false)
        .commentStore(
            comment: text,
            commentBy: commentBy,
            accessToken: accessToken,
            projectId: projectId)
        .then((value) {
      if (value == 200) {
        ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
            content: Text(
          'Comment added',
          style: TextStyle(
            color: Colors.green,
          ),
        )));
        _commentTextController.clear();
      }
    }).catchError((err) {
      if (kDebugMode) {
        print(err.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context, listen: false).user;

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: appDefaultSpace, vertical: appDefaultSpace * 2),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextField(
        controller: _commentTextController,
        onSubmitted: (value) => _handleSubmit(
            ctx: context,
            text: value.toString(),
            commentBy: user.username,
            accessToken: user.accessToken,
            projectId: widget.projectId),
        autofocus: true,
        decoration: const InputDecoration(
          hintText: '...',
        ),
      ),
    );
  }
}
