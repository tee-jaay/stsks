import 'package:flutter/material.dart';

import '../../../constants.dart';

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
      decoration: BoxDecoration(
        color: stBackgroundColorLight,
        borderRadius: BorderRadius.circular(50),
      ),
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
            SizedBox(
              width: stDefaultSpace,
            ),
          ],
        ),
      ),
    );
  }
}
