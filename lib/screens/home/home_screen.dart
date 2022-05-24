import 'package:flutter/material.dart';
import 'package:stasks/screens/dashboard/dashboard_screen.dart';

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
    return Center(
      child: TextButton(onPressed: (){
        Navigator.pushNamed(context, DashboardScreen.screenId);
      }, child:
        Text(
          widget.appTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      )

    );
  }
}
