import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FooterLinks extends StatelessWidget {
  const FooterLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Footer links",
      style: TextStyle(fontSize: 16, color: Colors.black45),
    );
  }
}
