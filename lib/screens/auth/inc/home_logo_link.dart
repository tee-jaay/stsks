import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../home/home_screen.dart';

class HomeLogoLink extends StatelessWidget {
  HomeLogoLink({required this.imagePath, Key? key}) : super(key: key);
  String imagePath;

  @override
  Widget build(BuildContext context) {
    Widget myWidget = GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, HomeScreen.screenId),
      child: Image(
        image: AssetImage(imagePath),
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
      ),
    );
    return myWidget.animate().fadeIn(duration: 2.seconds);
  }
}
