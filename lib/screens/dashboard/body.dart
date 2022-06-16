import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  DateTime todayDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(stDefaultSpace),
      child: Row(
        children: [
          const Text(
            "Welcome to Dashboard",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(formatDate(todayDate, [yy, '-', M, '-', d])),
        ],
      ),
    );
  }
}
