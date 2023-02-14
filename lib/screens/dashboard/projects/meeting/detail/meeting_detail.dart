import 'package:flutter/material.dart';

import '../../../../../settings/constants.dart';

class MeetingDetail extends StatelessWidget {
  MeetingDetail({required this.meeting, Key? key}) : super(key: key);
  var meeting;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              meeting.title,
              style: const TextStyle(color: Colors.black87),
            ),
            Text(
              meeting.createdBy,
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        ),
        SizedBox(
          height: appDefaultSpace,
        ),
        Text(
          meeting.agenda,
          style: const TextStyle(color: Colors.black87),
        ),
        SizedBox(
          height: appDefaultSpace,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.house,
              size: 12.0,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '${meeting.address}, ',
              style: const TextStyle(color: Colors.black87),
            ),
            Text(
              meeting.location,
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        ),
        SizedBox(
          height: appDefaultSpace,
        ),
        Row(
          children: [
            Icon(
              Icons.phone,
              size: 12,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              meeting.phone,
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        ),
        SizedBox(
          height: appDefaultSpace,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 12.0,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '${meeting.date}, ',
                  style: const TextStyle(color: Colors.black87),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.hourglass_bottom,
                  size: 12.0,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '${meeting.duration} hrs',
                  style: const TextStyle(color: Colors.black87),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.timer,
                  size: 12.0,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  meeting.time,
                  style: const TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
