import 'package:flutter/material.dart';
import '../../settings/constants.dart';

import 'components/hero_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static String screenId = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Hero(widget: widget),
          ],
        ),
      ),
    );
  }
}

class Hero extends StatelessWidget {
  const Hero({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return HeroSection(
      widget: widget,
      title: appName,
    );
  }
}
