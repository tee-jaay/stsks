import 'package:flutter/material.dart';

class AssigneesList extends StatelessWidget {
  const AssigneesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Assignees",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage('http://picsum.photos/40/40?q=1')),
            CircleAvatar(backgroundImage: NetworkImage('http://picsum.photos/40/40?q=2')),
            CircleAvatar(backgroundImage: NetworkImage('http://picsum.photos/40/40?q=3')),
            CircleAvatar(backgroundImage: NetworkImage('http://picsum.photos/40/40?q=4')),
            CircleAvatar(backgroundImage: NetworkImage('http://picsum.photos/40/40?q=5')),
          ],
        ),
      ],
    );
  }
}
