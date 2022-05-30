import 'package:flutter/material.dart';

import '../../dashboard/dashboard_screen.dart';
import '../home_screen.dart';

class Hero extends StatelessWidget {
  const Hero({
    Key? key,
    required this.widget, required this.title,
  }) : super(key: key);

  final HomeScreen widget;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFFf1f1f1),
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, DashboardScreen.screenId);
          },
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Color.fromRGBO(76, 175, 80, 1),
              fontSize: 32.0,
            ),
          ),
        ),
      ),
    );
  }
}