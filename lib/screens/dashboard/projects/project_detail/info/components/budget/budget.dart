import 'package:flutter/material.dart';

class Budget extends StatelessWidget {
  Budget({required this.estimate, required this.spent, Key? key})
      : super(key: key);
  String estimate;
  String spent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Budget",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        Row(
          children: [
            RichText(
              text: TextSpan(
                text: 'Estimate $estimate ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: 'Spent $spent',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
