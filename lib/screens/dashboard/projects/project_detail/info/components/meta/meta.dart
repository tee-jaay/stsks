import 'package:flutter/material.dart';

class Meta extends StatelessWidget {
  Meta(
      {required this.title,
      required this.description,
      required this.image,
      required this.status,
      Key? key})
      : super(key: key);
  String title;
  String description;
  String image;
  String status;

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
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(image),
        ),
        Text('Statue: $status'),
      ],
    );
  }
}
