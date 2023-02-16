import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../helpers/issueTypeColor.dart';
import '../../../settings/constants.dart';

class LatestIssues extends StatefulWidget {
  LatestIssues({required this.latestOpenIssues, Key? key}) : super(key: key);
  List latestOpenIssues;

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
        Container(
          height: widget.latestOpenIssues.length * 100,
          child: ListView.builder(
              itemBuilder: (context, index) => IssueItem(
                    about: widget.latestOpenIssues[index].title.toString(),
                    issueType:
                        widget.latestOpenIssues[index].type.toString(),
                    severity:
                        widget.latestOpenIssues[index].severity.toString(),
                    colorType: getIssueColor(
                        widget.latestOpenIssues[index].type.toString()),
                    colorSeverity: getIssueColor(
                        widget.latestOpenIssues[index].type.toString()),
                    press: () {},
                  ),
              itemCount: widget.latestOpenIssues.length),
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
            IssueAbout(about: about),
            IssueType(colorType: colorType, issueType: issueType),
            const Spacer(),
            IssueSeverity(severity: severity, colorSeverity: colorSeverity),
          ],
        ),
      ),
    );
  }
}

class IssueSeverity extends StatelessWidget {
  const IssueSeverity({
    super.key,
    required this.severity,
    required this.colorSeverity,
  });

  final String severity;
  final Color colorSeverity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: appDefaultSpace * 0.5),
      child: Text(
        severity,
        style: TextStyle(
          color: colorSeverity,
        ),
      ),
    );
  }
}

class IssueType extends StatelessWidget {
  const IssueType({
    super.key,
    required this.colorType,
    required this.issueType,
  });

  final Color colorType;
  final String issueType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: appDefaultSpace,
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: appDefaultSpace * 0.6, vertical: appDefaultSpace * 0.3),
      decoration: BoxDecoration(
          color: colorType, borderRadius: BorderRadius.circular(50)),
      child: Text(
        issueType,
        style: const TextStyle(
          fontSize: 12.0,
        ),
      ),
    );
  }
}

class IssueAbout extends StatelessWidget {
  const IssueAbout({
    super.key,
    required this.about,
  });

  final String about;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.symmetric(
        vertical: appDefaultSpace * 0.5,
        horizontal: appDefaultSpace * 0.5,
      ),
      child: Text(
        about,
      ),
    );
  }
}
