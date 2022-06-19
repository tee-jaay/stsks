import 'package:flutter/material.dart';
import 'package:stasks/screens/dashboard/inc/welcomeDate.dart';
import 'package:stasks/screens/dashboard/inc/recent_projects.dart';
import '../../../constants.dart';
import 'stat_cards.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(stDefaultSpace),
      child: Column(
        children: [
          welcomeDate(),
          SizedBox(
            height: stDefaultSpace * 1.4,
          ),
          StatCards(),
          SizedBox(
            height: stDefaultSpace,
          ),
          RecentProjects(),
        ],
      ),
    );
  }
}
