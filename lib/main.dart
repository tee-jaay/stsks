import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'settings/constants.dart';
import 'settings/routes.dart';

import './screens/home/home_screen.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  WidgetsFlutterBinding.ensureInitialized();
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
