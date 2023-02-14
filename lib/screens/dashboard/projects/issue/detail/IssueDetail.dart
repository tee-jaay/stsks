import 'package:flutter/material.dart';

import '../../../../../settings/constants.dart';

class IssueDetail extends StatelessWidget {
  IssueDetail({Key? key, required this.issue}) : super(key: key);
  var issue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Text(
              issue.title,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              issue.createdBy,
              style: const TextStyle(
                  color: Colors.black87),
            ),
          ],
        ),
        SizedBox(
          height: appDefaultSpace,
        ),
        Text(
          issue.description,
          style: const TextStyle(color: Colors.black87),
        ),
        SizedBox(
          height: appDefaultSpace,
        ),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Priority: ${issue.priority}',
              style: const TextStyle(
                  color: Colors.black87),
            ),
            Text(
              'Status: ${issue.status}',
              style: const TextStyle(
                  color: Colors.black87),
            ),
          ],
        ),
        SizedBox(
          height: appDefaultSpace,
        ),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Start: ${issue.start}',
              style: const TextStyle(
                  color: Colors.black87),
            ),
            Text(
              'End: ${issue.end}',
              style: const TextStyle(
                  color: Colors.black87),
            ),
          ],
        ),
        SizedBox(
          height: appDefaultSpace,
        ),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Severity: ${issue.severity}',
              style: const TextStyle(
                  color: Colors.black87),
            ),
            Text(
              'Bookmark: ${issue.bookmark}',
              style: const TextStyle(
                  color: Colors.black87),
            ),
          ],
        ),
        SizedBox(
          height: appDefaultSpace,
        ),
        Text(
          'Type: ${issue.type}',
          style: const TextStyle(color: Colors.black87),
        ),
      ],
    );
  }
}
