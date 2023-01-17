import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../settings/constants.dart';

class LatestIssues extends StatefulWidget {
  const LatestIssues({Key? key}) : super(key: key);

  @override
  State<LatestIssues> createState() => _LatestIssuesState();
}

class _LatestIssuesState extends State<LatestIssues> {
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
        const SizedBox(
          height: appDefaultSpace,
        ),
        Container(),
        IssueItem(
          about: "Dolorum molestias dolores vero",
          issueType: "maintenance",
          severity: "Critical",
          colorType: Colors.yellow,
          colorSeverity: Colors.yellow,
          press: () {
            if (kDebugMode) {
              print("pressed yellow");
            }
          },
        ),
        IssueItem(
          about: "Nesciunt consequuntur non dolo",
          issueType: "bug",
          severity: "moderate",
          colorType: Colors.red,
          colorSeverity: Colors.red,
          press: () {
            if (kDebugMode) {
              print("pressed red");
            }
          },
        ),
        IssueItem(
          about: "Quas vero voluptas cumque susc vero voluptas cumque susc",
          issueType: "feature",
          severity: "Upgrade",
          colorType: Colors.blue,
          colorSeverity: Colors.blue,
          press: () {
            if (kDebugMode) {
              print("pressed blue");
            }
          },
        ),
        IssueItem(
          about: "Unde libero consequatur suscip",
          issueType: "update",
          severity: "moderate",
          colorType: Colors.green,
          colorSeverity: Colors.green,
          press: () {
            if (kDebugMode) {
              print("pressed green");
            }
          },
        ),
      ],
    );
  }
}

class IssueItem extends StatelessWidget {
  const IssueItem({
    Key? key,
    required this.about,
    required this.issueType,
    required this.severity,
    required this.colorType,
    required this.colorSeverity,
    required this.press,
  }) : super(key: key);

  final String about, issueType, severity;
  final Color colorType, colorSeverity;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(bottom: appDefaultSpace),
        padding: const EdgeInsets.symmetric(
          vertical: appDefaultSpace * 0.7,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.symmetric(
                vertical: appDefaultSpace * 0.5,
                horizontal: appDefaultSpace * 0.5,
              ),
              child: Text(
                about,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: appDefaultSpace,
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: appDefaultSpace * 0.6,
                  vertical: appDefaultSpace * 0.3),
              decoration: BoxDecoration(
                  color: colorType, borderRadius: BorderRadius.circular(50)),
              child: Text(
                issueType,
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: appDefaultSpace * 0.5),
              child: Text(
                severity,
                style: TextStyle(
                  color: colorSeverity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
