import 'package:flutter/material.dart';

Color getIssueColor(String str) {
  switch (str) {
    case 'bug':
      return  Colors.red;
    case 'security':
      return Colors.purple;
    case 'feature':
      return Colors.teal;
    case 'upgrade':
      return Colors.blue;
    case 'update':
      return Colors.green;
    case 'maintenance':
      return Colors.yellow;
    default:
      return Colors.black87;
  }
}
