import 'package:flutter/material.dart';
import 'package:stasks/screens/dashboard/inc/welcomeDate.dart';
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

class RecentProjects extends StatelessWidget {
  const RecentProjects({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: stDefaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Projects",
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: stDefaultSpace * 0.5,
            ),
            RecentProjectItem(
              color: Colors.blue,
              title: "About low elo teemo",
              press: () {
                print("About low elo teemo");
              },
              date: "19 Jun, 2022",
            ),
            RecentProjectItem(
              color: Colors.red,
              title: "Project alpha zero",
              press: () {
                print("Project alpha zero");
              },
              date: "19 Jun, 2022",
            ),
            RecentProjectItem(
              color: Colors.yellow,
              title: "Lorem alpha zero",
              press: () {
                print("Kitkat alpha zero");
              },
              date: "10 Jun, 2021",
            ),
          ],
        ),
      ),
    );
  }
}

class RecentProjectItem extends StatelessWidget {
  const RecentProjectItem({
    Key? key,
    required this.color,
    required this.title,
    required this.press,
    required this.date,
  }) : super(key: key);

  final String title, date;
  final Color color;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: stDefaultSpace * 0.5),
      padding: EdgeInsets.symmetric(vertical: stDefaultSpace * 0.5),
      color: stBackgroundColorLight,
      child: GestureDetector(
        onTap: press,
        child: Row(
          children: [
            Container(
              width: stDefaultSpace * 0.5,
              height: stDefaultSpace,
              color: color,
            ),
            SizedBox(
              width: stDefaultSpace * 0.5,
            ),
            Container(
              height: stDefaultSpace,
              color: Colors.white10,
              // decoration: BoxDecoration(),
              child: Text(title),
            ),
            Spacer(),
            Text(date),
          ],
        ),
      ),
    );
  }
}
