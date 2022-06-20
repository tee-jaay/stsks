import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';

class LatestIssues extends StatelessWidget {
  const LatestIssues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Latest Issues",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        SizedBox(
          height: stDefaultSpace,
        ),
        Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "About",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Type",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Severity",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "User login error",
            ),
            Text(
              "Bug",
            ),
            Text(
              "Critical",
            ),
          ],
        ),
      ],
    );
  }
}
