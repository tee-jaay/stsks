import 'package:flutter/widgets.dart';
import '../screens/auth/new-password/new_password.dart';
import '../screens/auth/request-password/request_password.dart';
import '../screens/auth/sign-in/sign_in.dart';
import '../screens/auth/sign-up/sign_up.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/dashboard/projects/projects_list/projects_list_screen.dart';
import '../screens/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.screenId: (context) => const HomeScreen(),
  DashboardScreen.screenId: (context) => const DashboardScreen(),
  SignUpScreen.screenId: (context) => const SignUpScreen(),
  SignInScreen.screenId: (context) => const SignInScreen(),
  RequestPasswordScreen.screenId: (context) => const RequestPasswordScreen(),
  NewPasswordScreen.screenId: (context) => const NewPasswordScreen(),
  ProjectListScreen.screenId: (context) => const ProjectListScreen(),
};