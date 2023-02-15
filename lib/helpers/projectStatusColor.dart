import 'package:flutter/material.dart';

Color getColorForProjectStatus(String status) {
  switch (status) {
    case 'active':
      return Colors.blue;
    case 'completed':
      return Colors.green;
    case 'cancelled':
      return Colors.orange;
    default:
      return Colors.purple;
  }
}
