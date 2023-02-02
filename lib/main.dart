import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'settings/constants.dart';
import 'settings/routes.dart';
import './screens/home/home_screen.dart';
import 'controllers/auth_controller.dart';
import 'controllers/project_controller.dart';
import 'controllers/task_controller.dart';
import 'controllers/issue_controller.dart';
import 'controllers/timesheet_controller.dart';
import 'controllers/timesheet_log_controller.dart';
import 'controllers/meeting_controller.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyAppRoot());
}

class MyAppRoot extends StatelessWidget {
  const MyAppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProjectController(),
        ),
        ChangeNotifierProvider(
          create: (_) => TaskController(),
        ),
        ChangeNotifierProvider(
          create: (_) => IssueController(),
        ),
        ChangeNotifierProvider(
          create: (_) => TimesheetController(),
        ),
        ChangeNotifierProvider(
          create: (_) => TimesheetLogController(),
        ),
        ChangeNotifierProvider(
          create: (_) => MeetingController(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appName,
            theme: ThemeData(
                scaffoldBackgroundColor: appBackgroundColor,
                primaryColor: appPrimaryColor,
                textTheme:
                    Theme.of(context).textTheme.apply(bodyColor: appTextColor),
                appBarTheme: const AppBarTheme(
                  color: Colors.white,
                )),
            initialRoute: HomeScreen.screenId,
            routes: routes,
          );
        },
      ),
    );
  }
}
