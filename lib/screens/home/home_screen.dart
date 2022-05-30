import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';
import 'package:stasks/screens/dashboard/dashboard_screen.dart';

import 'components/description.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.appTitle}) : super(key: key);

  static String screenId = "home_screen";

  final String appTitle;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Hero(widget: widget),
          Description(),
        ],
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
    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFFf1f1f1),
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, DashboardScreen.screenId);
          },
          child: Text(
            widget.appTitle.toUpperCase(),
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
