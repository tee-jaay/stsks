import 'package:flutter/widgets.dart';
import 'package:stasks/screens/auth/new-password/new_password.dart';
import 'package:stasks/screens/auth/request-password/request_password.dart';
import 'package:stasks/screens/auth/sign-in/sign_in.dart';
import 'package:stasks/screens/auth/sign-up/sign_up.dart';
import 'package:stasks/screens/dashboard/dashboard_screen.dart';
import 'package:stasks/screens/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.screenId: (context) => HomeScreen(),
  DashboardScreen.screenId: (context) => DashboardScreen(),
  SignUpScreen.screenId: (context) => SignUpScreen(),
  SignInScreen.screenId: (context) => SignInScreen(),
  RequestPasswordScreen.screenId: (context) => RequestPasswordScreen(),
  NewPasswordScreen.screenId: (context) => NewPasswordScreen(),
};
