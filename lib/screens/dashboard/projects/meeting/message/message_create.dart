import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/meeting_controller.dart';
import '../../../../../controllers/auth_controller.dart';

class MessageCreate extends StatefulWidget {
  MessageCreate({required this.meetingId, Key? key}) : super(key: key);
  String meetingId;

  @override
  State<MessageCreate> createState() => _MessageCreateState();
}

class _MessageCreateState extends State<MessageCreate> {
  TextEditingController textEditingController = TextEditingController();

  void addMessage({required String accessToken, required String createdBy}) {
    Object newObj = {
      "message": textEditingController.text,
      "createdBy": createdBy,
    };
    Provider.of<MeetingController>(context, listen: false)
        .messageAdd(
            meetingId: widget.meetingId,
            accessToken: accessToken,
            newObj: newObj)
        .then((value) {
      if (value == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Message sent',
          style: TextStyle(color: Colors.green),
        )));
        textEditingController.clear();
        Provider.of<MeetingController>(context, listen: false).clearMeetings();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Error occurred',
          style: TextStyle(color: Colors.orange),
        )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context, listen: false).user;
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: 'type here...',
      ),
      onEditingComplete: () =>
          addMessage(accessToken: user.accessToken, createdBy: user.username),
    );
  }
}
