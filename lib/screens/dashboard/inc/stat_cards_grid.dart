import 'package:flutter/material.dart';

import '../../../models/dashboard.dart';
import 'stat_card.dart';

class StatCardsGrid extends StatelessWidget {
  const StatCardsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        children: List.generate(
            dashboardStats.length, (index) {
          return StatCard(
            scrWidth: dashboardStats[index].scrWidth,
            scrHeight: dashboardStats[index].scrHeight,
            name: dashboardStats[index].name,
            count: dashboardStats[index].count,
            icon: dashboardStats[index].icon,
            color: dashboardStats[index].color,
          );
        }),
      ),
    );
  }
}
