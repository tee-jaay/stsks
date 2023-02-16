import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/auth_controller.dart';

class DiscussionCommentSingle extends StatelessWidget {
  const DiscussionCommentSingle({required this.comment, required this.commentBy, Key? key})
      : super(key: key);
  final String comment;
  final String commentBy;

  @override
  Widget build(BuildContext context) {
    final username =
        Provider.of<AuthController>(context, listen: false).user.username;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Row(
          children: [
            Text(
              commentBy == username ? 'You: ' : '$commentBy: ',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              comment,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
