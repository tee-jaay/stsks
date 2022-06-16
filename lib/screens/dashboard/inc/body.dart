import 'package:flutter/material.dart';
import 'package:stasks/screens/dashboard/inc/welcomeDate.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final scrWidth = MediaQuery.of(context).size.width * 0.28;
    late double scrHeight = 160.0;

    return Padding(
      padding: EdgeInsets.all(stDefaultSpace),
      child: Column(
        children: [
          welcomeDate(),
          Row(
            children: [
              Container(
                width: scrWidth,
                height: scrHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.task,
                      size: 24.0,
                      semanticLabel: 'Projects',
                    ),
                    Text(
                      "134",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "Projects",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
