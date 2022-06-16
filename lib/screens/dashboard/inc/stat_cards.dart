import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'stat_card.dart';

class StatCards extends StatelessWidget {
  const StatCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final scrWidth = MediaQuery.of(context).size.width * 0.2;
    late double scrHeight = 160.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StatCard(
          scrWidth: scrWidth,
          scrHeight: scrHeight,
          count: '43',
          name: 'projects',
          color: projectColor,
          icon: Icon(
            Icons.archive,
            size: 24.0,
            semanticLabel: 'projects',
          ),
        ),
        StatCard(
          scrWidth: scrWidth,
          scrHeight: scrHeight,
          count: '1345',
          name: 'tasks',
          color: taskColor,
          icon: Icon(
            Icons.task,
            size: 24.0,
            semanticLabel: 'tasks',
          ),
        ),
        StatCard(
          scrWidth: scrWidth,
          scrHeight: scrHeight,
          count: '94',
          name: 'issues',
          color: issueColor,
          icon: Icon(
            Icons.list,
            size: 24.0,
            semanticLabel: 'issues',
          ),
        ),
        StatCard(
          scrWidth: scrWidth,
          scrHeight: scrHeight,
          count: '34',
          name: 'meeting',
          color: meetingColor,
          icon: Icon(
            Icons.people,
            size: 24.0,
            semanticLabel: 'meeting',
          ),
        ),
      ],
    );
  }
}
