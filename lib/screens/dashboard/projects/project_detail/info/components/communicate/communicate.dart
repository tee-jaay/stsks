import 'package:flutter/material.dart';

class Communicate extends StatelessWidget {
  const Communicate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Communicate",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                // Todo: message this project assignees feature
                print('message');
              },
              icon: Icon(Icons.edit_note),
              color: Colors.purpleAccent,
            ),
            IconButton(
              onPressed: () {
                // Todo: phone/conference this project assignees feature
                print('phone');
              },
              icon: Icon(Icons.send_to_mobile),
              color: Colors.blueAccent,
            ),
            IconButton(
              onPressed: () {
                // Todo: video conference
                print('video conference');
              },
              icon: Icon(Icons.camera_alt),
              color: Colors.orangeAccent,
            ),
            IconButton(
                onPressed: () {
                  // Todo: Notification
                  print('notify');
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.greenAccent,
                )),
          ],
        ),
      ],
    );
  }
}
