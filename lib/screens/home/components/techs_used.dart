import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:stasks/constants.dart';

import 'package:stasks/screens/home/components/section_title.dart';

class TechsUsed extends StatelessWidget {
  const TechsUsed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: stDefaultSpace),
        child: Column(
          children: [
            Container(
              child: SectionTitle(
                title: "Techs used",
              ),
            ),
            SizedBox(
              height: stDefaultSpace * 4,
            ),
            Row(
              children: [
                customTechChip(
                  text: "express.js",
                ),
                Spacer(),
                customTechChip(
                  text: "react.js",
                ),
                Spacer(),
                customTechChip(
                  text: "mongoDB",
                ),
                Spacer(),
                customTechChip(
                  text: "flutter",
                ),
              ],
            ),
            SizedBox(
              height: stDefaultSpace * 4,
            ),
          ],
        ),
      ),
    );
  }
}

class customTechChip extends StatelessWidget {
  const customTechChip({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Color(0xff2e2e2e),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
