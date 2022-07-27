import 'package:flutter/material.dart';
import 'package:stasks/constants.dart';
import 'package:stasks/routes.dart';
import 'package:stasks/screens/home/home_screen.dart';

void main() {
  runApp(const StasksApp());
}

class StasksApp extends StatelessWidget {
  const StasksApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
          scaffoldBackgroundColor: stBackgroundColor,
          primaryColor: stPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: stTextColor),
          appBarTheme: const AppBarTheme(
            color: Colors.white,
          )),
      initialRoute: HomeScreen.screenId,
      routes: routes,
    );
  }
}
