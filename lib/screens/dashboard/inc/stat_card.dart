import 'package:flutter/material.dart';
import '../../../settings/constants.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    Key? key,
    required this.scrWidth,
    required this.scrHeight,
    required this.name,
    required this.count,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final double scrWidth;
  final double scrHeight;

  final String name;
  final String count;
  final Color color;

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scrWidth,
      height: scrHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(appDefaultSpace),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: icon,
          ),
          const Spacer(),
          Text(
            "${name.toUpperCase()}($count)",
            style: TextStyle(
              fontSize: 18.0,
              color: color,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
