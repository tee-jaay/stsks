import 'package:flutter/material.dart';

class Meta extends StatelessWidget {
  Meta({required this.title, required this.description, Key? key})
      : super(key: key);
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
