import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FooterLinks extends StatelessWidget {
  const FooterLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "About",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          "ToS",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
