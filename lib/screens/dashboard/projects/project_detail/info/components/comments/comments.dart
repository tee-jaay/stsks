import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Comments screen",
      style: TextStyle(
        color: Colors.black,
        fontSize: 24.0,
      ),
    );
  }
}
