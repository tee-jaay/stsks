import 'package:flutter/material.dart';
import 'package:stasks/screens/dashboard/inc/welcomeDate.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(stDefaultSpace),
      child: Column(
        children: [
          welcomeDate(),
        ],
      ),
    );
  }
}
