import 'package:flutter/material.dart';
import '../../../constants.dart';

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
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Spacer(),
          Container(
            padding: EdgeInsets.all(stDefaultSpace),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: color,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: icon,
          ),
          Spacer(),
          Text(
            count,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(
            height: stDefaultSpace * 0.8,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
