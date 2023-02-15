import 'package:flutter/material.dart';

import '../../../helpers/statCardIcon.dart';
import '../../../helpers/statCardTextColor.dart';
import 'stat_card.dart';

class StatCardsGrid extends StatelessWidget {
  StatCardsGrid({Key? key, required this.statData}) : super(key: key);
  final List statData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: List.generate(
              statData.length, (index) {
            return StatCard(
              scrWidth: 360,
              scrHeight: 360,
              name: statData[index].name,
              count: statData[index].count,
              icon: getStatCardIcon(statData[index].name),
              color: getStatCardTextColor(statData[index].name),
            );
          }),
        ),
      ),
    );
  }
}
