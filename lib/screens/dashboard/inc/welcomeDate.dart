import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

DateTime todayDate = DateTime.now();
Row welcomeDate() {
  return Row(
    children: [
      const Text(
        "Welcome to Dashboard",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const Spacer(),
      Text(formatDate(todayDate, [yy, '-', M, '-', d])),
    ],
  );
}
