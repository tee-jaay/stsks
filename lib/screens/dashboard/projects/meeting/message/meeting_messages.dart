import 'package:flutter/material.dart';

import 'messages_list.dart';
import 'message_create.dart';

class MeetingMessages extends StatelessWidget {
  MeetingMessages({required this.messages, Key? key, required this.meetingId}) : super(key: key);
  var messages;
  String meetingId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MessagesList(messages:messages),
        MessageCreate(meetingId:meetingId),
      ],
    );
  }
}
