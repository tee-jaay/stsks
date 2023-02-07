import 'package:flutter/widgets.dart';

import '../screens/dashboard/projects/task/edit/task_edit_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/auth/sign-in/sign_in.dart';
import '../screens/auth/sign-up/sign_up.dart';
import '../screens/auth/new-password/new_password.dart';
import '../screens/auth/request-password/request_password.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/dashboard/projects/project_detail/project_detail_screen.dart';
import '../screens/dashboard/projects/projects_list/projects_list_screen.dart';
import '../screens/dashboard/projects/timesheet/list/timesheets_list_screen.dart';
import '../screens/dashboard/projects/task/create/task_create_screen.dart';
import '../screens/dashboard/projects/issue/list/issues_list_screen.dart';
import '../screens/dashboard/projects/meeting/list/meetings_list_screen.dart';
import '../screens/dashboard/projects/task/list/tasks_list_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.screenId: (context) => const HomeScreen(),
  DashboardScreen.screenId: (context) => const DashboardScreen(),
  SignUpScreen.screenId: (context) => const SignUpScreen(),
  SignInScreen.screenId: (context) => const SignInScreen(),
  RequestPasswordScreen.screenId: (context) => const RequestPasswordScreen(),
  NewPasswordScreen.screenId: (context) => const NewPasswordScreen(),
  ProjectListScreen.screenId: (context) => const ProjectListScreen(),
  ProjectDetailScreen.screenId: (context) => const ProjectDetailScreen(),
  TasksListScreen.screenId: (context) => const TasksListScreen(),
  TaskCreateScreen.screenId: (context) => const TaskCreateScreen(),
  TaskEditScreen.screenId: (context) => const TaskEditScreen(),
  IssuesListScreen.screenId: (context) => const IssuesListScreen(),
  MeetingsListScreen.screenId: (context) => const MeetingsListScreen(),
  TimeSheetsScreen.screenId: (context) => const TimeSheetsScreen(),
};
