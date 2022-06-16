import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';

import '../../dashboard/dashboard_screen.dart';
import '../home_screen.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    Key? key,
    required this.widget,
    required this.title,
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
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextLiquidFill(
              text: appName,
              waveColor: stPrimaryColor,
              boxBackgroundColor: stBackgroundColorLight,
              textStyle: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 300.0,
            ),
          ),
        ),
      ),
    );
  }
}
