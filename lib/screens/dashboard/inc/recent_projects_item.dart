import 'package:flutter/material.dart';

import '../../../settings/constants.dart';

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
      margin: const EdgeInsets.only(bottom: appDefaultSpace * 0.8),
      padding: const EdgeInsets.symmetric(vertical: appDefaultSpace * 0.5),
      decoration: BoxDecoration(
        color: appBackgroundColorLight,
        borderRadius: BorderRadius.circular(50),
      ),
      child: GestureDetector(
        onTap: press,
        child: Row(
          children: [
            Container(
              width: appDefaultSpace * 0.5,
              height: appDefaultSpace,
              color: color,
            ),
            const SizedBox(
              width: appDefaultSpace * 0.5,
            ),
            Container(
              height: appDefaultSpace,
              color: Colors.white10,
              // decoration: BoxDecoration(),
              child: Text(title),
            ),
            const Spacer(),
            Text(date),
            const SizedBox(
              width: appDefaultSpace,
            ),
          ],
        ),
      ),
    );
  }
}
