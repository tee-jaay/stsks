import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';
import 'package:easy_table/easy_table.dart';

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
        SizedBox(
          height: stDefaultSpace,
        ),
        Container(),
        IssueItem(
          about: "Dolorum molestias dolores vero",
          issueType: "maintenance",
          severity: "Critical",
          colorType: Colors.yellow,
          colorSeverity: Colors.yellow,
          press: () {
            print("pressed yellow");
          },
        ),
        IssueItem(
          about: "Nesciunt consequuntur non dolo",
          issueType: "bug",
          severity: "moderate",
          colorType: Colors.red,
          colorSeverity: Colors.red,
          press: () {
            print("pressed red");
          },
        ),
        IssueItem(
          about: "Quas vero voluptas cumque susc vero voluptas cumque susc",
          issueType: "feature",
          severity: "Upgrade",
          colorType: Colors.blue,
          colorSeverity: Colors.blue,
          press: () {
            print("pressed blue");
          },
        ),
        IssueItem(
          about: "Unde libero consequatur suscip",
          issueType: "update",
          severity: "moderate",
          colorType: Colors.green,
          colorSeverity: Colors.green,
          press: () {
            print("pressed green");
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
        margin: EdgeInsets.only(bottom: stDefaultSpace),
        padding: EdgeInsets.symmetric(
          vertical: stDefaultSpace * 0.7,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: EdgeInsets.symmetric(
                vertical: stDefaultSpace * 0.5,
                horizontal: stDefaultSpace * 0.5,
              ),
              child: Text(
                about,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: stDefaultSpace,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: stDefaultSpace * 0.6,
                  vertical: stDefaultSpace * 0.3),
              decoration: BoxDecoration(
                  color: colorType, borderRadius: BorderRadius.circular(50)),
              child: Text(
                issueType,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: stDefaultSpace * 0.5),
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
