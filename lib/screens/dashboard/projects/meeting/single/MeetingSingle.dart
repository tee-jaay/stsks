import 'package:flutter/material.dart';
import 'package:prozeqts/screens/dashboard/projects/meeting/detail/meeting_detail.dart';
import 'package:prozeqts/screens/dashboard/projects/meeting/message/meeting_messages.dart';

import '../../../../../settings/constants.dart';

class MeetingSingle extends StatelessWidget {
  MeetingSingle({
    required this.meeting,
    super.key,
  });

  var meeting;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MeetingDetail(meeting:meeting),
            SizedBox(
              height: appDefaultSpace,
            ),
            MeetingMessages(messages:meeting.comments, meetingId:meeting.id),
          ],
        ),
      ),
    );
  }
}
