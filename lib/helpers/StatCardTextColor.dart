import 'package:flutter/material.dart';

import '../settings/constants.dart';

double iconSize = 80.0;

Color getStatCardTextColor(String str) {
  switch (str) {
    case 'projects':
      return projectColor;
    case 'tasks':
      return taskColor;
    case 'issues':
      return issueColor;
    default:
      return meetingColor;
  }
}
