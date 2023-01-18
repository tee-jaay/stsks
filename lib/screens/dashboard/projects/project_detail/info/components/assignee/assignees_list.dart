import 'package:flutter/material.dart';

class AssigneesList extends StatelessWidget {
  List<dynamic> assignees;

  AssigneesList({required this.assignees, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Assignees",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 80.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: assignees.length,
            itemBuilder: (context, index) => CircleAvatar(
                backgroundImage:
                    NetworkImage(assignees[index]["userAvatar"])),
          ),
        ),
      ],
    );
  }
}
