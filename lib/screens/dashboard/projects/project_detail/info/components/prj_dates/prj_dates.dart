import 'package:flutter/material.dart';

class PrjDates extends StatelessWidget {
  PrjDates({required this.createdAt, required this.updatedAt, Key? key})
      : super(key: key);
  String createdAt;
  String updatedAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Dates",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        Text('Started at: $createdAt',),
        Text('Updated at: $updatedAt',),
      ],
    );
  }
}
