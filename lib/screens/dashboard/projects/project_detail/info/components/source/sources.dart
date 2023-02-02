import 'package:flutter/material.dart';

class Sources extends StatelessWidget {
  Sources(
      {required this.repoLink,
      required this.urlOne,
      required this.urlTwo,
      Key? key})
      : super(key: key);

  String repoLink;
  String urlOne;
  String urlTwo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sources & Links",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        Text(
          "Repository: $repoLink",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
        Text(
          "Link: $urlOne",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
        Text(
          "Link: $urlTwo",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
