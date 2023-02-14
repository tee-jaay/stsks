import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  MessagesList({required this.messages, Key? key}) : super(key: key);
  var messages;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: CircleAvatar(
            foregroundImage:
            NetworkImage("https://picsum.photos/40?q=$i"),
          ),
          title: Text(messages[i]["message"]),
        ),
      ),
    );
  }
}
