import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  Comment({required this.comment,required this.commentBy, Key? key}) : super(key: key);

  String comment;
  String commentBy;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$commentBy: ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          comment,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
