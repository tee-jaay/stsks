import 'package:flutter/material.dart';

import '../settings/constants.dart';

double iconSize = 80.0;

Icon getStatCardIcon(String str) {
  switch (str) {
    case 'projects':
      return Icon(
        Icons.archive,
        size: iconSize,
        color: projectColor,
      );
    case 'tasks':
      return Icon(
        Icons.account_tree,
        size: iconSize,
        color: taskColor,
      );
    case 'issues':
      return Icon(
        Icons.list,
        size: iconSize,
        color: issueColor,
      );
    default:
      return Icon(
        Icons.people,
        size: iconSize,
        color: meetingColor,
      );
  }
}
