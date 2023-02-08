import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../controllers/auth_controller.dart';

class Comment extends StatelessWidget {
  Comment({required this.comment, required this.commentBy, Key? key})
      : super(key: key);
  String comment;
  String commentBy;

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
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              comment,
              style: TextStyle(
                color: commentBy == username ? Colors.grey : Colors.black,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
