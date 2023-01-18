import 'package:flutter/material.dart';

class Meta extends StatelessWidget {
  Meta(
      {required this.title,
      required this.description,
      required this.image,
      required this.status,
      required this.commentsCount,
      required this.createdBy,
        Key? key,
      })
      : super(key: key);
  String title;
  String description;
  String image;
  String status;
  String commentsCount;
  String createdBy;

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
        SizedBox(
          width: 60.0,
          child: Row(
            children: [
              Icon(
                Icons.comment,
                color: Colors.black,
              ),
              Text(
                commentsCount,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        Text('Statue: $status'),
        Text('Created by: $createdBy'),
      ],
    );
  }
}
