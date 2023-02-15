import 'package:flutter/material.dart';

import '../settings/constants.dart';

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
